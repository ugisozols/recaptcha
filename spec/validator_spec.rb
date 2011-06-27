require "spec_helper"

describe Recaptcha::Validator do
  describe "validate_recaptcha" do
    it "takes 3 params" do
      expect{ Recaptcha::Validator.validate_recaptcha("first", "second", "third") }.to_not raise_error(ArgumentError)
    end
  end
end
