$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "test_response_extend"
require "active_support/all"
require "rack"
require "set"
require "action_dispatch/http/response"
require "action_dispatch/http/mime_type"
require "action_dispatch/testing/test_response"

require "minitest/autorun"
require "minitest/pride"
