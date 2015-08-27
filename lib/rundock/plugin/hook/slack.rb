require "rundock/plugin/hook/slack/version"
require 'slack'

module Rundock
  module Hook
    class Slack < Base
      def hook(node_attributes, log_buffer)

        Slack.configure do |config|
          config.token = @contents[:token]
        end

        Logger.info("send slack to #{@contents[:channel]} channel")

        post_args = @contents.dup.delete(:token)

        Logger.debug("post args: #{post_args.to_s}")

        Slack.chat_postMessage(post_args)
      end
    end
  end
end
