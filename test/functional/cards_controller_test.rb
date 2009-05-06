require 'test_helper'

class CardsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:cards)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_card
    assert_difference('Card.count') do
      post :create, :card => { }
    end

    assert_redirected_to card_path(assigns(:card))
  end

  def test_should_show_card
    get :show, :id => cards(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => cards(:one).id
    assert_response :success
  end

  def test_should_update_card
    put :update, :id => cards(:one).id, :card => { }
    assert_redirected_to card_path(assigns(:card))
  end

  def test_should_destroy_card
    assert_difference('Card.count', -1) do
      delete :destroy, :id => cards(:one).id
    end

    assert_redirected_to cards_path
  end
end
