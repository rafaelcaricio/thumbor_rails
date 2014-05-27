require 'thumbor_rails/helpers'

module ThumborRails
  mattr_accessor :server_url
  @@server_url = 'http://thumbor.example.com'

  mattr_accessor :security_key
  @@security_key = 'MY_SECURITY_KEY'

  def self.setup
    yield self
  end
end
