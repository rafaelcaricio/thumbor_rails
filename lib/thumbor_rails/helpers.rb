require 'ruby-thumbor'

module ThumborRails
  module Helpers

    def thumbor_url(image_url, options = {})
      options[:image] = image_url
      "#{ThumborRails.server_url}#{thumbor_service.generate(options)}"
    end

    private

    def thumbor_service
      Thumbor::CryptoURL.new(ThumborRails.security_key)
    end

  end
end

ActionView::Base.send :include, ThumborRails::Helpers
