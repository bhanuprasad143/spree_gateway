module Spree
  class Gateway::AuthorizeNet < Gateway
    preference :login, :string
    preference :password, :string

    attr_accessible :preferred_login, :preferred_password

    def provider_class
      ActiveMerchant::Billing::AuthorizeNetGateway
    end

    def options_with_test_preference
      # always use test = false for Authorize.net
      options_without_test_preference# .merge(:test => self.preferred_test_mode)
    end

    alias_method_chain :options, :test_preference
  end
end
