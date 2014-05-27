require 'ruby-thumbor'

module ThumborRails
  module Helpers
    include ActionView::Helpers::AssetTagHelper

    def thumbor_url(image_url, options = {})
      options[:image] = image_url
      thumbor_service = crypto_service
      thumbor_service = unsafe_service if options[:unsafe]
      "#{ThumborRails.server_url}#{thumbor_service.generate(options)}"
    end

    def thumbor_image_tag(image_url, options = {}, tag_attrs = {})
      image_tag(thumbor_url(image_url, options), tag_attrs)
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
