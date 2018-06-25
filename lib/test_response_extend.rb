require "test_response_extend/version"
require "set"
require "rack"
require "active_support/all"
require "action_dispatch/http/response"
require "action_dispatch/http/mime_type"
require "action_dispatch/testing/test_response"


module TestResponseExtend
end

ActionDispatch::TestResponse.module_eval do
  def json
    if body.blank?
      nil
    else
      indifferent_access(JSON.parse(body))
    end
  end

  private
  def indifferent_access(obj)
    case obj
    when Hash
      hash = HashWithIndifferentAccess.new(obj)
      hash.each{|k, v| hash[k] = indifferent_access(v) }
    when Array
      obj.map{|v| indifferent_access(v) }
    else
      obj
    end
  end
end
