module ActiveAdmin
  module Umeditor
    class << self
      def configration
        @configration ||= Configration.new
      end

      def config_umeditor
        yield configration.umeditor_config
      end
    end

    class Configration
      def umeditor_config
        @umeditor_config ||= {
          "UMEDITOR_HOME_URL" => "/active_admin/umeditor/",
          "toolbar" => ['undo redo | bold italic underline']
        }
      end
    end
  end
end
