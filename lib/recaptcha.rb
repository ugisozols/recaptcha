require "recaptcha/controller_mixins"
require "recaptcha/recaptcha_helper"
require "recaptcha/validator"

module Recaptcha
  class Engine < Rails::Engine
    initializer "controller and view helper mixins" do
      ActionController::Base.send :include, Recaptcha::ControllerMixins
      ActionView::Base.send :include, Recaptcha::RecaptchaHelper
    end
  end
end
