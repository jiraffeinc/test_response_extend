require "test_helper"

class TestResponseExtendTest < Minitest::Test
  class MockResponseBase
    def body
      ""
    end

    def status
      200
    end

    def headers
      {}
    end
  end

  class JsonTextResponse < MockResponseBase
    def body
      {integer: 1, hash: {array: [1, 2], hash: {boolean: false}}}.to_json
    end
  end

  def test_that_it_has_a_version_number
    refute_nil ::TestResponseExtend::VERSION
  end

  def test_response_json
    json = ActionDispatch::TestResponse.from_response(JsonTextResponse.new).json
    assert_equal 1, json[:hash][:array].first
    assert_equal false, json["hash"]["hash"][:boolean]
  end

  def test_response_json_as_blank
    json = ActionDispatch::TestResponse.from_response(MockResponseBase.new).json
    assert_nil json
  end
end
