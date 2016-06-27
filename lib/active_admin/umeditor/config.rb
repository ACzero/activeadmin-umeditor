module ActiveAdmin
  module Umeditor
    class << self
      def configration
        @configration ||= Configration.new
      end

      def config_umeditor
        yield configration.umeditor_config
      end

      def upload_config
        @upload_config ||= Uploader.new
      end

      def config_uploader
        yield upload_config
      end

      def up_image_response(image_path, title, original)
        {
          state: "SUCCESS",
          url: image_path,
          title: title,
          original: original
        }
      end

    end

    class Configration
      def umeditor_config
        @umeditor_config ||= {
          "UMEDITOR_HOME_URL" => "/active_admin/umeditor/",
          "imagePath" => "",
          "imageUrl" => "/active_admin/umeditor/images",
          "toolbar" => ['undo redo | bold italic underline']
        }
      end
    end

    class Uploader
      attr_accessor :image_url_prefix

      def image_save_path=(path)
        @image_save_path = path
      end

      def image_save_path
        @image_save_path || Rails.root.join('public', 'active_admin', 'umeditor', 'uploads')
      end

      def image_url_base=(url)
        @image_url_base = url
      end

      def image_url_base
        @image_url_base || "active_admin/umeditor/uploads"
      end

      def set_prefix?
        self.image_url_prefix.present?
      end
    end
  end
end
