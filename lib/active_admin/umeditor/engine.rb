module ActiveAdmin
  module Umeditor
    class Engine < ::Rails::Engine
      engine_name 'activeadmin-umeditor'

      initializer "umeditor.add_assets_path", group: :all do |app|
        app.config.assets.precompile += [
          'active_admin/umeditor.css',
          'active_admin/umeditor.js',
          'active_admin/umeditor/images/*'
        ]

        ActiveAdmin.setup do |config|
          config.register_stylesheet 'active_admin/umeditor.css'
          config.register_javascript 'active_admin/umeditor.js'
        end
      end
    end
  end
end
