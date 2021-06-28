# Preview all emails at http://localhost:3000/rails/mailers/test_notifier_mailer
class TestNotifierMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/test_notifier_mailer/test
  def test
    TestNotifierMailer.test
  end

end
