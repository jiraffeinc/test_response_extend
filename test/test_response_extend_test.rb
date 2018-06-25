require "test_helper"

class TestResponseExtendTest < Minitest::Test
  class MockResponse
    def body
      {integer: 1, hash: {array: [1, 2], hash: {boolean: false}}}.to_json
    end

    def status
      200
    end

    def headers
      {}
    end
  end

  def test_that_it_has_a_version_number
    refute_nil ::TestResponseExtend::VERSION
  end

  def test_response_json
    response = ActionDispatch::TestResponse.from_response(MockResponse.new)
    json = response.json
    assert_equal 1, json[:hash][:array].first
    assert_equal false, json["hash"]["hash"][:boolean]
  end
end
