require 'bundler/gem_tasks'

TOKEN_FILE = '~/.rundock/slack.token'

task :default => [:spec]

desc 'Run all tests.'
task :spec => ['setup', 'rundock']

desc 'Setup environments'

task :setup do
  Bundler.with_clean_env do
    exit unless FileTest.exist?(TOKEN_FILE)
    token = File.read(TOKEN_FILE)
    system "sed -i -e 's/<SLACK_TOKEN>/#{token}/g' ./spec/integration/scenario.yml"
  end
end

desc "Run rundock-slack plugin"

task :rundock do
  cmd = "bundle exec rundock do ./spec/integration/scenario.yml -k ./spec/integration/hooks.yml -l"
  puts "[EXEC: ] #{cmd}"
  system cmd
end
