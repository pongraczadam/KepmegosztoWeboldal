require "test_helper"

class UploadImageTest < ActionDispatch::IntegrationTest
  test "upload image" do
    get loginpage_path
    assert_response :success
    assert_select 'legend', 'Bejelentkezés' 
    assert_nil session[:user]

    post login_path, params: {email: users(:three).email, password: 'titok'}, headers: {'HTTP_REFERER': loginpage_path}
    assert_response :redirect
    assert_equal session[:user], users(:three).id
    follow_redirect!
    assert_select 'legend', users(:three).name
    assert_select 'legend', 'Képek'
    assert_select 'img', Image.count

    get new_image_path
    assert_response :success
    assert_select 'legend', 'Kép feltöltése'

    upload_file = fixture_file_upload('test/fixtures/files/testFile', 'image/jpeg')
    post upload_images_path, params: { image: upload_file }, headers: { 'HTTP_REFERER': new_image_path }
    assert_response :redirect
    follow_redirect!
    assert_select 'legend', 'Kép tulajdonságai'
    assert_select 'p', 'Feltöltő: ' + users(:three).name

    get logout_path, headers: { 'HTTP_REFER': images_path}
    assert_response :redirect
    assert_nil session[:user]
    follow_redirect!
    assert_select 'legend', 'Bejelentkezés'
  end
end
