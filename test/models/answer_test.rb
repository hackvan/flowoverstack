require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  def setup
    @user = users(:diego)
    @question = @user.questions.new(title: "Test", body: "Test")
    @answer = @question.answers.new(body: "Answer Test", user: @user)
  end

  test "should be valid" do
    assert @answer.valid?
  end

  test "body should be present" do
    @answer.body = "   "
    assert_not @answer.valid?
  end

end
