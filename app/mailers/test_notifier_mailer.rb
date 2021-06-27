class TestNotifierMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.test_notifier_mailer.test.subject
  #
  def test
    @greeting = "Hi"

    mail to: "rocket4ce@gmail.com"
  end
end
