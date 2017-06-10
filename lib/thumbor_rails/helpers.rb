require 'ruby-thumbor'

module ThumborRails
  module Helpers
    include ActionView::Helpers::AssetTagHelper

    def thumbor_url(image_url, options = {})
      if ThumborRails.force_no_protocol_in_source_url
        image_url = image_url.sub(/^http(s|):\/\//, '')
      end
      
      unless options[:unsafe]
        image_url = ERB::Util.url_encode(image_url)
      end
      
      options[:image] = image_url
      thumbor_service = crypto_service
      thumbor_service = unsafe_service if options[:unsafe]
      host = ThumborRails.server_url
      path = thumbor_service.generate(options)
      if host =~ /%d/
        host = host % (Zlib.crc32(path) % 4)
      end
      host + path
    end

    def thumbor_image_tag(image_url, options = {}, tag_attrs = {})
      tag_attrs[:alt] ||= image_alt(image_url)
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
