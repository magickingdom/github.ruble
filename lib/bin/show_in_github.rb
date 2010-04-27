#!/usr/bin/env ruby

$:.unshift(File.dirname(__FILE__) + "/..")
require "rubygems"
require "show_in_github"

begin
  url = ShowInGitHub.url_for(ENV['TM_FILEPATH'])
  lines = ENV['TM_INPUT_START_LINE'] ? "#{ENV['TM_INPUT_START_LINE']}-#{ENV['TM_LINE_NUMBER']}" : ENV['TM_LINE_NUMBER']
  if RUBY_PLATFORM.downcase =~ /(win|w)32$/
    `explorer #{url}#L#{lines}`
  else
    `open #{url}#L#{lines}`
  end
rescue NotGitRepositoryError
  puts "File/project not a git repository"
rescue NotGitHubRepositoryError
  puts "File/project has not been pushed to a github repository"
end