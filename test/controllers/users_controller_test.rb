require_relative '../../test/test_helper'

class UsersControllerTest < ActionController::TestCase

  def test_index
    assert_response(:success)
  end

  def test_new
	 assert_response(:success)
  end

  def test_edit
    assert_response(:success)
  end

  def test_create
    assert_response(:success)
  end

  def test_update
    assert_response(:success)
  end

  def test_destroy
    assert_response(:success)
  end

  def test_new_ajax
    xhr(:get, :new)
    assert_response(:success)
    assert_template('users/_new')
    assert(json_response['html'],
      "should be in html")
  end

  def test_edit_ajax
    user = users(:user_info)
    xhr(:get, :edit, {:id => user.id})
    assert_response(:success)
    assert_template('users/_edit',
        'template has been mismatching')  
    assert(json_response['html'], 
      "should be in html")  
  end

  def test_create_ajax
    xhr(:post, :create, user_params)
    assert_response(:success)
    assert_template('users/_table')
  end

  def test_update_ajax
    user = users(:user_update_info)
    params = user_params.merge(:id => user.id)
    xhr(:put, :create, params)
    assert_response(:success)
    assert_template('users/_table')
  end

  def test_destroy_ajax
    user = users(:user_info)
    xhr(:delete, :destroy, {:id => user.id})
    assert_response(:success)
    assert_template('users/_table')
  end
end
