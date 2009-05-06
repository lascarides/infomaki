require 'test_helper'

class PageviewsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:pageviews)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_pageview
    assert_difference('Pageview.count') do
      post :create, :pageview => { }
    end

    assert_redirected_to pageview_path(assigns(:pageview))
  end

  def test_should_show_pageview
    get :show, :id => pageviews(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => pageviews(:one).id
    assert_response :success
  end

  def test_should_update_pageview
    put :update, :id => pageviews(:one).id, :pageview => { }
    assert_redirected_to pageview_path(assigns(:pageview))
  end

  def test_should_destroy_pageview
    assert_difference('Pageview.count', -1) do
      delete :destroy, :id => pageviews(:one).id
    end

    assert_redirected_to pageviews_path
  end
end
