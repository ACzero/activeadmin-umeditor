module ActiveAdmin
  module Generators
    class UmeditorGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def copy_initializer_file
        directory "active_admin", "public/active_admin"
        readme "README"
      end
    end
  end
end
