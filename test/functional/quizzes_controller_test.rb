require 'test_helper'

class QuizzesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:quizzes)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_quiz
    assert_difference('Quiz.count') do
      post :create, :quiz => { }
    end

    assert_redirected_to quiz_path(assigns(:quiz))
  end

  def test_should_show_quiz
    get :show, :id => quizzes(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => quizzes(:one).id
    assert_response :success
  end

  def test_should_update_quiz
    put :update, :id => quizzes(:one).id, :quiz => { }
    assert_redirected_to quiz_path(assigns(:quiz))
  end

  def test_should_destroy_quiz
    assert_difference('Quiz.count', -1) do
      delete :destroy, :id => quizzes(:one).id
    end

    assert_redirected_to quizzes_path
  end
end
