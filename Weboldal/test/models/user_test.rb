require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "cannot_save_user_without_name" do
    u = User.new email: 'valaki@mail.bme.hu'
    assert !u.save, "Probléma adódott a teszt futtatása során" 
  end

  test "cannot_save_user_without_email" do
    u = User.new name: 'Valaki'
    assert !u.save, "Probléma adódott a teszt futtatása során" 
  end

  test "cannot_save_user_without_existing_email" do
    u = User.new email: users(:one).email
    assert !u.save, "Probléma adódott a teszt futtatása során" 
  end

  test "encrypted" do
    u = User.find users(:one).id
    assert_equal u.encrypted_password, Digest::SHA1.hexdigest('titoktitok'), "A titkosítás nem megfelelő"
  end
end
