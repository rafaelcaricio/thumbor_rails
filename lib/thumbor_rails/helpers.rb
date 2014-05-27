require 'ruby-thumbor'

module ThumborRails
  module Helpers

    def thumbor_url(image_url, options = {})
      options[:image] = image_url
      thumbor_service = crypto_service
      thumbor_service = unsafe_service if options[:unsafe]
      "#{ThumborRails.server_url}#{thumbor_service.generate(options)}"
    end

    private

    def crypto_service
      Thumbor::CryptoURL.new(ThumborRails.security_key)
    end

    def unsafe_service
      Thumbor::CryptoURL.new(nil)
    end
  end
end

ActionView::Base.send :include, ThumborRails::Helpers
