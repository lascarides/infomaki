require 'test_helper'

class CardGroupsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:card_groups)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_card_group
    assert_difference('CardGroup.count') do
      post :create, :card_group => { }
    end

    assert_redirected_to card_group_path(assigns(:card_group))
  end

  def test_should_show_card_group
    get :show, :id => card_groups(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => card_groups(:one).id
    assert_response :success
  end

  def test_should_update_card_group
    put :update, :id => card_groups(:one).id, :card_group => { }
    assert_redirected_to card_group_path(assigns(:card_group))
  end

  def test_should_destroy_card_group
    assert_difference('CardGroup.count', -1) do
      delete :destroy, :id => card_groups(:one).id
    end

    assert_redirected_to card_groups_path
  end
end
