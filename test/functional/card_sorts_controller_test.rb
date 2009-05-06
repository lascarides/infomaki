require 'test_helper'

class CardSortsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:card_sorts)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_card_sort
    assert_difference('CardSort.count') do
      post :create, :card_sort => { }
    end

    assert_redirected_to card_sort_path(assigns(:card_sort))
  end

  def test_should_show_card_sort
    get :show, :id => card_sorts(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => card_sorts(:one).id
    assert_response :success
  end

  def test_should_update_card_sort
    put :update, :id => card_sorts(:one).id, :card_sort => { }
    assert_redirected_to card_sort_path(assigns(:card_sort))
  end

  def test_should_destroy_card_sort
    assert_difference('CardSort.count', -1) do
      delete :destroy, :id => card_sorts(:one).id
    end

    assert_redirected_to card_sorts_path
  end
end
