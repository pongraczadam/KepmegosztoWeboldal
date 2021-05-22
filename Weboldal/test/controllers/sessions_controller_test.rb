require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "login" do
    get loginpage_path
    assert_response :success
    assert_select 'legend', 'Bejelentkezés' 
    assert_nil session[:user]
    
    post login_path, params: {email: users(:one).email, password: 'titok'}, headers: {'HTTP_REFERER': loginpage_path}
    assert_response :redirect
    assert_equal session[:user], users(:one).id
    follow_redirect!
    assert_select 'legend', users(:one).name
    assert_select 'legend', 'Képek' 
  end

  test "invalid login" do
    get loginpage_path
    assert_response :success
    assert_select 'legend', 'Bejelentkezés' 
    assert_nil session[:user]

    post login_path, params: {email: users(:one).email, password: 'titok2'}, headers: {'HTTP_REFERER': loginpage_path}
    assert_response :redirect
    assert_nil session[:user]
    follow_redirect!
    assert_select 'legend', 'Bejelentkezés' 
  end

  test "logout" do
    get loginpage_path
    assert_response :success
    assert_select 'legend', 'Bejelentkezés' 
    assert_nil session[:user]

    post login_path, params: {email: users(:one).email, password: 'titok'}, headers: {'HTTP_REFERER': loginpage_path}
    assert_response :redirect
    assert_equal session[:user], users(:one).id
    follow_redirect!
    assert_select 'legend', users(:one).name
    assert_select 'form input[type=submit][value=Kijelentkezés]'

    get logout_path, headers: { 'HTTP_REFER': images_path}
    assert_response :redirect
    assert_nil session[:user]
    follow_redirect!
    assert_select 'legend', 'Bejelentkezés' 
  end
end
