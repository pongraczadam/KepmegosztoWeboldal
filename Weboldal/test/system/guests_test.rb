require "application_system_test_case"

class GuestsTest < ApplicationSystemTestCase
  test "login logout" do
    visit loginpage_path
    assert_selector 'legend', text: "Bejelentkezés"
    
    fill_in "Email", with: users(:one).email
    fill_in "Jelszó", with: 'titok'
    
    within '#centerForm' do
      click_on "Bejelentkezés"
    end

    page.driver.browser.switch_to.alert.accept

    assert_selector 'legend', text: "Képek"
    click_on "Kijelentkezés"

    page.driver.browser.switch_to.alert.accept
    assert_selector 'legend', text: "Bejelentkezés"
  end
end
