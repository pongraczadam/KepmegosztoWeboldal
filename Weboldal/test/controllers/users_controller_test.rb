require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get loginpage_path
    assert_response :success
    assert_select 'legend', 'Bejelentkezés' 
    assert_nil session[:user]
  end

  test "should get new" do
    get register_path
    assert_response :success
    assert_select 'legend', 'Regisztráció' 
    assert_nil session[:user]
  end

  test "should get forgotten" do
    get forgottenpage_path
    assert_response :success
    assert_select 'legend', 'Add meg az email címed a jelszó helyreállításához' 
    assert_nil session[:user]
  end
end
