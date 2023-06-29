# frozen_string_literal: true

require 'slack-notifier'

module Barkbox
  class SlackError < StandardError
    attr_reader :response

    def initialize(response)
      @response = response
      super
    end
  end

  class SlackClient < Slack::Notifier::Util::HTTPClient
    # NOTE: Defining self.post here to override call to superclass
    def self.post(uri, params)
      new(uri, params).call
    end

    def call
      http_obj.request(request_obj).tap do |resp|
        raise Barkbox::SlackError, resp unless resp.is_a?(Net::HTTPSuccess)
      end
    end
  end

  class Notifier < Slack::Notifier
    def initialize(*args, &blk)
      super
      config.http_client(Barkbox::SlackClient)
    end

    def ping(*args)
      super
    rescue Barkbox::SlackError => e
      Log.this("Could not Slack. #{e.response.to_json}")
    end
  end
end
