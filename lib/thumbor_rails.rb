require 'thumbor_rails/helpers'

module ThumborRails
  mattr_accessor :server_url
  @@server_url = 'http://thumbor.example.com'

  mattr_accessor :security_key
  @@security_key = nil

  mattr_accessor :force_no_protocol_in_source_url
  @@force_no_protocol_in_source_url = false

  def self.setup
    yield self
  end
end
