require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = images(:one)
  end
  
  test "should get index" do
    post login_path, params: {email: users(:one).email, password: 'titok'}, headers: {'HTTP_REFERER': loginpage_path}
    assert_equal session[:user], users(:one).id
    get images_path
    assert_response :success
    assert_select 'legend', 'Képek'
  end

  test "should get new" do
    post login_path, params: {email: users(:one).email, password: 'titok'}, headers: {'HTTP_REFERER': loginpage_path}
    assert_equal session[:user], users(:one).id
    get new_image_path
    assert_response :success
    assert_select 'legend', 'Kép feltöltése'
  end

  test "should get show" do
    post login_path, params: {email: users(:one).email, password: 'titok'}, headers: {'HTTP_REFERER': loginpage_path}
    assert_equal session[:user], users(:one).id
    get image_path @image
    assert_response :success
    assert_select 'legend', 'Kép tulajdonságai'
    assert_select 'p', 'Feltöltő: ' + User.find_by(id: @image.user_id).name
  end
end
