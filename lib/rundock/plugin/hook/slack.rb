require "rundock/plugin/hook/slack/version"
require 'slack'

module Rundock
  module Hook
    class Slack < Base
      def hook(operation_attributes, log_buffer)

        ::Slack.configure do |config|
          config.token = @contents[:token]
        end

        @contents[:channel] = '#' + @contents[:channel]
        Logger.info("send slack to #{@contents[:channel]} channel")
        post_args = @contents.dup.reject {|k, v| k == :token}

        out_msg = ''
        log_buffer.each do |log|
          out_msg += log.formatted_message
        end

        Logger.debug("post args: #{post_args.to_s}")

        post_args[:text] = out_msg
        ::Slack.chat_postMessage(post_args) unless operation_attributes[0][:dry_run]
      end
    end
  end
end
