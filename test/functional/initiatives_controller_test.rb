require 'test_helper'

class InitiativesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:initiatives)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_initiative
    assert_difference('Initiative.count') do
      post :create, :initiative => { }
    end

    assert_redirected_to initiative_path(assigns(:initiative))
  end

  def test_should_show_initiative
    get :show, :id => initiatives(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => initiatives(:one).id
    assert_response :success
  end

  def test_should_update_initiative
    put :update, :id => initiatives(:one).id, :initiative => { }
    assert_redirected_to initiative_path(assigns(:initiative))
  end

  def test_should_destroy_initiative
    assert_difference('Initiative.count', -1) do
      delete :destroy, :id => initiatives(:one).id
    end

    assert_redirected_to initiatives_path
  end
end
