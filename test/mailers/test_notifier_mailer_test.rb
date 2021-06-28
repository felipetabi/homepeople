require "test_helper"

class TestNotifierMailerTest < ActionMailer::TestCase
  test "test" do
    mail = TestNotifierMailer.test
    assert_equal "Test", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
