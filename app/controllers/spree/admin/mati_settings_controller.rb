module Spree
  module Admin
    class MatiSettingsController < Spree::Admin::BaseController
      
      def edit
        @config      = Spree::MatiSetting.new
        @preferences = [:import_row_from_title,
                        :ama_title,
                        :ama_description
                        ]
      end

      def update
        config = Spree::MatiSetting.new

        params.each do |name, value|
          next unless config.has_preference? name
          config[name] = value
        end


        flash[:success] = Spree.t(:successfully_updated, resource: Spree.t('mati_settings.title'))
        redirect_to admin_mati_settings_path
      end
    end
  end
end