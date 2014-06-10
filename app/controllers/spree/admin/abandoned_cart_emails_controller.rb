require 'rake'
Yebo::Application.load_tasks
module Spree
  module Admin
    class AbandonedCartEmailsController < Spree::Admin::BaseController

      def update
        params[:preferences][:abandoned_cart_email_active] == '1' ? params[:preferences][:abandoned_cart_email_active] = true :params[:preferences][:abandoned_cart_email_active] = false
        Spree::AbandonedCartEmailConfig::Config.set(params[:preferences])

        ::Rake::Task['abandoned_cart:delete_cron'].execute
        ::Rake::Task['abandoned_cart:generate_cron'].execute if Spree::AbandonedCartEmailConfig::Config[:abandoned_cart_email_active]

        respond_to do |format|
          format.html {
            redirect_to edit_admin_abandoned_cart_email_path
          }
        end
      end
    end
  end
end
