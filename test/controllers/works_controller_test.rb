require 'test_helper'

class WorksControllerTest < ControllerTestCase
  
  def setup
    sign_in create(:user)
  end
  
  test 'should create new item' do
    assert_difference 'Work.count', 1 do
      post :create, id: 5, title: 'Title', remote_id: 'cool123', quantity: 2
    end
    
    assert_response :success
    assert_template 'works/_update_form'
    assert_equal 'cool123', JSON.parse(@response.body)['remoteId']
    assert_not_equal 5, assigns(:work).id
    assert_equal 'cool123', assigns(:work).remote_id
    assert_equal 2, assigns(:work).quantity
  end
  
  test 'should get show' do
    create :work, id: 1
    
    get :show, id: 1
    assert_response :success
    assert assigns(:work).is_a?(Work)
  end
  
  test 'should update item' do
    create :work, id: 1, quantity: 1, title: 'original'
    
    put :update, id: 1, work: { quantity: 2, title: 'cool' }
    assert_response :success
    
    work = assigns(:work)
    assert_equal 'original', work.title
    assert_equal 2, work.quantity
  end
  
  test 'should destroy item' do
    create :work, id: 1, remote_id: 'googlies'
    
    delete :destroy, id: 1
    assert_response :success
    
    assert_equal 1, assigns(:work).id
    assert_equal({ 'remoteId' => 'googlies' }, JSON.parse(@response.body))
  end
  
  test 'should check if given books are in inventory' do
    create :work, id: 1, remote_id: 'abc123'
    create :work, id: 2, remote_id: 'def123'
    create :work, id: 3, remote_id: 'hij123'
    
    get :check_inventory, gbIds: ['abc123', 'notThere', 'hij123']
    
    assert_response :success
    assert_template 'works/_update_form'
    assert_equal ['abc123', 'hij123'], JSON.parse(@response.body).keys
  end
  
end
