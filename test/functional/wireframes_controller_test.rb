require 'test_helper'

class WireframesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:wireframes)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_wireframe
    assert_difference('Wireframe.count') do
      post :create, :wireframe => { }
    end

    assert_redirected_to wireframe_path(assigns(:wireframe))
  end

  def test_should_show_wireframe
    get :show, :id => wireframes(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => wireframes(:one).id
    assert_response :success
  end

  def test_should_update_wireframe
    put :update, :id => wireframes(:one).id, :wireframe => { }
    assert_redirected_to wireframe_path(assigns(:wireframe))
  end

  def test_should_destroy_wireframe
    assert_difference('Wireframe.count', -1) do
      delete :destroy, :id => wireframes(:one).id
    end

    assert_redirected_to wireframes_path
  end
end
