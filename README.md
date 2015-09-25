# Rundock::Plugin::Hook::Slack
[![Gem Version](https://badge.fury.io/rb/rundock-plugin-hook-slack.svg)](http://badge.fury.io/rb/rundock-plugin-hook-slack)
<!--
[![Circle CI](https://circleci.com/gh/hiracy/rundock-plugin-hook-slack/tree/master.png?style=shield)](https://circleci.com/gh/hiracy/rundock-plugin-hook-slack/tree/master)
-->

[Rundock](https://github.com/hiracy/rundock) plugin for [slack API](https://api.slack.com/) hook.

## Installation

```
$ gem install rundock
```

```
$ gem install rundock-plugin-hook-slack
```

## Usage

Edit your operation scenario to hooks.yml like this sample.

```
my_slack_channel:                          # hook name
  hook_type: slack                         # hook_type(always specify 'slack')
                                           # You can use chat.postMesasge Arguments(https://api.slack.com/methods/chat.postMessage)
  token: xxxx-9999999999-999999999-99999   # token argument(required)
  channel: my_channel                      # channel argument(required)
  username: rundock-bot                    # username(optional)
  icon_url: http:/icon.org/rundock-bot.png # icon_url(optional)
                                           #       :
sub_slack_channel:
  hook_type: slack
  token: xxxx-1111111111-999999999-99999
  channel: sub_channel
```

And edit your operation scenario to "[scenario.yml](https://github.com/hiracy/rundock/blob/master/scenario_sample.yml)" like this sample.

```
- target: anyhost-01
  deploy:
    - src: /path/to/great/middleware/conf_src.rb  # deploy source file from localhost
      dst: /path/to/great/middleware/conf_dst.rb  # deploy destination file to remotehost
  command:
    - /etc/init.d/great_middleware start
  hook:
    - my_slack_channel                            # enable hook(hooks.yml/my_slack_channel)
    - sub_slack_channel
---
anyhost-01:                                       # see rundock options(https://github.com/hiracy/rundock/blob/master/README.md)
  host: 192.168.10.11
  ssh_opts:
    port: 22
    user: anyuser
    key:  ~/.ssh/id_rsa
```

and execute rundock.

    $ rundock do /path/to/your-dir/scenario.yml -k /path/to/your-dir/hooks.yml

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rundock-plugin-hook-slack/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

