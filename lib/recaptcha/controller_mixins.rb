module Recaptcha
  module ControllerMixins
    extend ActiveSupport::Concern

    module ClassMethods
      def recaptcha(options = {})
        options = {
          :actions => :create
        }.merge(options)

        before_filter :validate_recaptcha, :only => options[:actions]
      end
    end

    module InstanceMethods
      def validate_recaptcha
        status, error = Recaptcha::Validator.validate_recaptcha(params[:recaptcha_challenge_field],
                                                                params[:recaptcha_response_field],
                                                                request.remote_ip)
        if status == "false"
          flash[:error] = error
          redirect_to :back
        end
      end

      protected :validate_recaptcha
    end
  end
end
