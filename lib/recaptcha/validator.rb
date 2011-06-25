require "net/http"
require "uri"

module Recaptcha
  module Validator
    def self.validate_recaptcha(challenge, response, remoteip)
      uri = URI.parse("http://www.google.com/recaptcha/api/verify")
      params = {
        :privatekey => ENV['RECAPTCHA_PRIVATE_KEY'],
        :challenge => challenge,
        :response => response,
        :remoteip => remoteip
      }

      Net::HTTP.post_form(uri, params).body.split("\n")
    end
  end
end
