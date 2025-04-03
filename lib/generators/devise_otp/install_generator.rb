module DeviseOtp
  module Generators # :nodoc:
    # Install Generator
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Install the devise OTP authentication extension"

      def add_configs
        content = <<-CONTENT

  # ==> Devise OTP Extension
  # Configure OTP extension for devise

  # OTP is mandatory, users are going to be asked to
  # enroll OTP the next time they sign in, before they can successfully complete the session establishment.
  # This is the global value, can also be set on each user.
  #config.otp_mandatory = false

  # Drift: a window which provides allowance for drift between a user's token device clock
  # (and therefore their OTP tokens) and the authentication server's clock.
  # Expressed in minutes centered at the current time. (Note: it's a number, *NOT* 3.minutes )
  #config.otp_drift_window = 3

  # Users that have logged in longer than this time ago, are going to be asked their password
  # (and an OTP challenge, if enabled) before they can see or change their otp informations.
  #config.otp_credentials_refresh = 15.minutes

  # Users are given a list of one-time recovery tokens, for emergency access
  # set to false to disable giving recovery tokens.
  #config.otp_recovery_token_count = 10

  # The user is allowed to set his browser as "trusted", no more OTP challenges will be
  # asked for that browser, for a limited time.
  # set to false to disable setting the browser as trusted
  #config.otp_trust_persistence = 1.month

  # The name of the token issuer, to be added to the provisioning
  # url. Display will vary based on token application. (defaults to the Rails application class)
  #config.otp_issuer = 'my_application'

  # Custom view path for Devise OTP controllers
  #config.otp_controller_path = 'devise'

  # Request recovery code after n failed otp attempts
  #config.otp_max_failed_attempts = 10

  # Request recovery code if last failed attempt was within timeout
  #config.otp_recovery_timeout = 30.minutes

  # Email OTP code valid for
  #config.otp_by_email_code_timeout = 5.minutes

  # Max number of allowed recovery attempts before recovery is blocked
  #config.otp_recovery_max_failed_attempts = 5

  # Block recovery for this duration after otp_recovery_max_failed_attempts is exceeded
  #config.otp_recovery_blocked_timeout = 30.minutes

        CONTENT

        inject_into_file "config/initializers/devise.rb", content, before: /end[ |\n]+\Z/
      end

      def copy_locale
        copy_file "../../../config/locales/en.yml", "config/locales/devise.otp.en.yml"
      end
    end
  end
end
