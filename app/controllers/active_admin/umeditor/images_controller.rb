module ActiveAdmin
  module Umeditor
    class ImagesController < ApplicationController
      skip_before_filter :verify_authenticity_token

      def create
        FileUtils.mkdir_p(save_directory)
        file = params[:upfile]

        if file
          file_path = save_file(file)

          render text: ActiveAdmin::Umeditor.up_image_response(
            image_url(file_path),
            file.original_filename,
            file.original_filename
          ).to_json
        else
          render nothing: true
        end
      end

      private
      def save_file(uploaded_file)
        origin_name = uploaded_file.original_filename
        saved_name ="#{hash_name(origin_name)}.#{file_ext(origin_name)}"
        path = "#{save_directory}/#{saved_name}"
        file = File.new(path, "w", :encoding => 'ascii-8bit')
        file.write(uploaded_file.read)
        file.close

        ActiveAdmin::Umeditor.upload_config.image_url_base + "/" + saved_name
      end

      def file_ext(file_name)
        reg = /.+\.(.*)$/
        if match = reg.match(file_name)
          match[1]
        else
          ""
        end
      end

      def hash_name(file_name)
        Digest::SHA1.hexdigest file_name
      end

      def save_directory
        ActiveAdmin::Umeditor.upload_config.image_save_path
      end

      def image_url(path)
        if ActiveAdmin::Umeditor.upload_config.set_prefix?
          ActiveAdmin::Umeditor.upload_config.image_url_prefix + path
        else
          request.protocol + request.host_with_port + "/" + path
        end
      end
    end
  end
end
