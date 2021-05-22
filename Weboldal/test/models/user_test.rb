require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "cannot save user without name" do
    u = User.new email: 'valaki@mail.bme.hu'
    assert !u.save, "A user elmentődött" 
  end

  test "cannot save user without email" do
    u = User.new name: 'Valaki'
    assert !u.save, "A user elmentődött" 
  end

  test "cannot save user with existing email" do
    u = User.new email: users(:one).email
    assert !u.save, "A user elmentődött" 
  end

  test "encrypted" do
    u = User.find users(:one).id
    assert_equal u.encrypted_password, Digest::SHA1.hexdigest('titoktitok'), "A titkosítás nem megfelelő"
  end
end
