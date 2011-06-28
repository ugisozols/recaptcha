require "spec_helper"
require "rspec/mocks/standalone"

describe Recaptcha::Validator do
  describe "validate_recaptcha" do
    it "takes 3 args" do
      expect{ Recaptcha::Validator.validate_recaptcha("first", "second", "third") }.to_not raise_error(ArgumentError)
    end

    context "returns a series of strings seperated by \\n" do
      context "when captcha solution correct" do
        it "returns true" do
          Net::HTTP.stub_chain(:post_form, :body).and_return("true")
          Recaptcha::Validator.validate_recaptcha("1", "2", "3").should == ["true"]
        end
      end

      context "when incorrect recaptcha key" do
        it "returns false and invalid-site-private-key" do
          Net::HTTP.stub_chain(:post_form, :body).and_return("false\ninvalid-site-private-key")
          Recaptcha::Validator.validate_recaptcha("1", "2", "3").should == ["false", "invalid-site-private-key"]
        end
      end

      context "when challenge param incorrect" do
        it "returns false and invalid-request-cookie" do
          Net::HTTP.stub_chain(:post_form, :body).and_return("false\ninvalid-request-cookie")
          Recaptcha::Validator.validate_recaptcha("1", "2", "3").should == ["false", "invalid-request-cookie"]
        end
      end

      context "when captcha solution incorrect" do
        it "returns false and incorrect-captcha-sol" do
          Net::HTTP.stub_chain(:post_form, :body).and_return("false\nincorrect-captcha-sol")
          Recaptcha::Validator.validate_recaptcha("1", "2", "3").should == ["false", "incorrect-captcha-sol"]
        end
      end
    end
  end
end
