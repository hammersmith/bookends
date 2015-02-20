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
    location = create :location

    assert_difference 'Work.count', 1 do
      post :create, work: {
                    id:           5,
                    title:        'Title',
                    author:       'C.S. Lewis',
                    description:  'Cool Stuff',
                    media_format: 'BOOK',
                    publisher:    'Harper Collins',
                    published_on: '1950-06-07',
                    location_id:  location.id
                  }
    end

    work = assigns(:work)
    assert_redirected_to work_path(work.id)
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
    create :work, id: 1, title: 'original'

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

  test 'should return json search response' do
    work = create :work,
                  title: 'Go Down Moses',
                  author: 'William Faulkner',
                  description: 'A good book',
                  publisher: 'Random House',
                  published_on: '1/1/1942',
                  image_url: 'http://upload.wikimedia.org/wikipedia/en/6/65/GoDownMoses.jpg'

    WorkSearch.expects(:search).with('Moses').returns([work])

    assert_no_difference 'Work.count' do
      xhr :get, :search, query: 'Moses'
    end

    assert_response :success
    assert_not_nil assigns(:works)
    search_results = JSON.parse(@response.body, symbolize_names: true)
    expected_results = {
      works: [
        {
          title: work.title,
          author: work.author,
          description: work.description,
          media_format: work.media_format,
          publisher: work.publisher,
          published_on: work.published_on.to_s,
          image_url: work.image_url,
          location: {
            name: work.location.name,
            shelf: work.location.shelf,
            color: work.location.color
          }
        }
      ]
    }

    assert_equal expected_results, search_results
  end
  
end
