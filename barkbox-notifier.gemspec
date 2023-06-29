# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = "barkbox-notifier"
  s.version = "0.0.1"
  s.summary = "Slack notifier for Barkbox"
  s.description = "Slack notifier for Barkbox"
  s.authors = ["Alan Fung-Schwarz", "Barkbox"]
  s.email = "afung-schwarz@barkbox.com"
  s.files = ["lib/barkbox_notifier.rb", "version.rb"]
  s.homepage = "https://github.com/barkbox/barkbox-notifier"
  s.license = "MIT"

  s.add_dependency "slack-notifier", "~> 2.3"
  s.add_development_dependency "debugger", "~> 1.6"
  s.add_development_dependency "minitest", "~> 5.10"
end
