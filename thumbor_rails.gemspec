# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'thumbor_rails/version'

Gem::Specification.new do |s|
  s.name = "thumbor_rails"
  s.version = ThumborRails::VERSION

  s.authors = ["Rafael Caricio"]
  s.description = "thumbor_rails is a client for the thumbor imaging service (http://github.com/globocom/thumbor) for Ruby and Rails projects."
  s.email = ["rafael@caricio.com"]
  s.files =  Dir.glob('lib/**/*.rb') << 'README.md'
  s.test_files = Dir.glob('spec/**/*.rb')
  s.homepage = "https://github.com/rafaelcaricio/thumbor_rails"
  s.rdoc_options = ["--main", "README.md"]
  s.summary = "thumbor_rails is a client to manage and generate urls for the thumbor imaging service (http://github.com/globocom/thumbor) for Ruby and Rails projects."
  s.license = "MIT"

  s.add_dependency 'ruby-thumbor', '>= 1.2.1'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake'
end
