module ThumborRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Copy ThumborRails default configuration files"
      source_root File.expand_path('../templates', __FILE__)

      def copy_config
        template "config/initializers/thumbor_rails.rb"
      end
    end
  end
end
