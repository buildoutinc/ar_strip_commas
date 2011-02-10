require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "ar_strip_commas"
  gem.homepage = "http://github.com/tilleryj/ar_strip_commas"
  gem.license = "MIT"
  gem.summary = %Q{ActiveRecord extension for handling numeric column input with commas}
  gem.description = %Q{An ActiveRecord extension for properly parsing strings with commas as input to numeric columns. }
  gem.email = "tilleryj@thinklinkr.com"
  gem.authors = ["Jason Tillery"]
end
Jeweler::RubygemsDotOrgTasks.new
