# frozen_string_literal: true

require 'minitest/autorun'
require 'barkbox_notifier'
require 'version'

module Barkbox
  class NotifierTest < Minitest::Test
    def test_that_it_has_a_version_number
      refute_nil ::Barkbox::Notifier::VERSION
    end

    def test_notifier_raise_error
      uri = "https://hooks.slack.com/services/XXXXXXXXX/XXXXXXXXX/XXXXXXXXXXXXXXXXXXXXXXXX"
      notifier = Barkbox::Notifier.new(uri)
      error = assert_raises Barkbox::SlackError do
        notifier.post(text: "Test", channel: "non-existent-channel", username: "foo")
      end
      assert_equal "404", error.response.code
      assert_equal "channel_not_found", error.response.body
      assert_equal "Not Found", error.response.msg
    end
  end
end
