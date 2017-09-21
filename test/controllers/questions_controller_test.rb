require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest

  test "should get root" do
    get root_path
    assert_template 'questions/index'
  end

  test "should get index" do
    get questions_path
    assert_response :success
  end

end
