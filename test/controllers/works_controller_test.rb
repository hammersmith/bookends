require 'test_helper'

class WorksControllerTest < ControllerTestCase
  
  def setup
    sign_in create(:user)
  end

  test 'should set blank new work' do
    assert_no_difference 'Work.count' do
      get :new
    end

    assert_response :success
    assert_template 'works/_form'
    assert_instance_of Work, assigns(:work)
  end
  
  test 'should create new item' do
    assert_difference 'Work.count', 1 do
      post :create, work: {
                    id:           5,
                    title:        'Title',
                    author:       'C.S. Lewis',
                    description:  'Cool Stuff',
                    media_format: 'BOOK',
                    publisher:    'Harper Collins',
                    published_on: '1950-06-07'
                  }
    end

    assert_redirected_to works_path
    work = assigns(:work)
    assert_not_equal 5, work.id
    assert_equal 'Title', work.title
    assert_equal 'Book', work.media_format
    assert_equal 'Harper Collins', work.publisher
    assert_equal Date.parse('1950-06-07'), work.published_on
  end

  test 'should render form errors on create' do
    assert_no_difference 'Work.count' do
      post :create, work: {
                    id:           5,
                    author:       'C.S. Lewis',
                    description:  'Cool Stuff',
                    media_format: 'Thing',
                    publisher:    'Harper Collins',
                    published_on: '1950-06-07'
                  }
    end

    assert_response :not_acceptable
    assert_template 'create', partial: 'form'
  end
  
  test 'should get show' do
    create :work, id: 1

    get :show, id: 1
    assert_response :success
    assert_template 'works/_update_form'
    assert_instance_of Work, assigns(:work)
  end

  test 'should update item' do
    thing = create :work, id: 1, title: 'original'

    assert_no_difference 'Work.count' do
      put :update, id: 1, work: { title: 'Poems', publisher: 'Faber' }
    end
    assert_response :success

    work = assigns(:work)
    assert_equal 'Poems', work.title
    assert_equal 'Faber', work.publisher
  end

  test 'should not update item if invalid' do
    create :work, id: 1, title: 'original'

    assert_no_difference 'Work.count' do
      put :update, id: 1, work: { title: '', publisher: 'Faber' }
    end
    assert_response :not_acceptable

    assert_instance_of Work, assigns(:work)
  end

  test 'should destroy item' do
    create :work, id: 1

    assert_difference 'Work.count', -1 do
      delete :destroy, id: 1
    end
    assert_response :success

    assert_equal 1, assigns(:work).id
  end
  
end
