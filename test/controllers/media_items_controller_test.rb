require 'test_helper'

class MediaItemsControllerTest < ControllerTestCase
  
  def setup
    sign_in create(:user)
  end
  
  test 'should create new item' do
    assert_difference 'MediaItem.count', 1 do
      post :create, id: 5, title: 'Title', remote_id: 'cool123', quantity: 2
    end
    
    assert_response :success
    assert_template 'media_items/_update_form'
    assert_equal 'cool123', JSON.parse(@response.body)['remoteId']
  end
  
  test 'should get show' do
    create :media_item, id: 1
    
    get :show, id: 1
    assert_response :success
    assert assigns(:media_item).is_a?(MediaItem)
  end
  
end
