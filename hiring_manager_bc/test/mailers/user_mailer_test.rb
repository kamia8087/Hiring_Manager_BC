require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "application_update" do
    mail = UserMailer.application_update
    assert_equal "Application update", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "new_interview" do
    mail = UserMailer.new_interview
    assert_equal "New interview", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "new_feedback" do
    mail = UserMailer.new_feedback
    assert_equal "New feedback", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
