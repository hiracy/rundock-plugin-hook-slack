require 'bundler/gem_tasks'

TOKEN_FILE = "#{Dir.home}/.rundock/slack.token"

task :default => [:spec]

desc 'Run all tests.'
task :spec => ['setup', 'rundock']

desc 'Setup environments'

task :setup do
  Bundler.with_clean_env do
    unless FileTest.exist?(TOKEN_FILE)
      puts "#{TOKEN_FILE} not found."
      exit
    end
    token = File.read(TOKEN_FILE)
    src = File.read('./spec/integration/hooks.yml')
    File.write("#{Dir.home}/.rundock/rundock-plugin-hook-slack-hooks.yml", src.gsub(/<SLACK_TOKEN>/, token.strip))
  end
end

desc "Run rundock-slack plugin"

task :rundock do
  cmd = "bundle exec rundock do ./spec/integration/scenario.yml -k #{Dir.home}/.rundock/rundock-plugin-hook-slack-hooks.yml -l debug"
  puts "[EXEC: ] #{cmd}"
  system cmd
end
