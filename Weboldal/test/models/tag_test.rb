require "test_helper"

class TagTest < ActiveSupport::TestCase
    test "cannot_save_favourite_with_existing" do
        t = Tag.new(name: tags(:one).name, image_id: tags(:one).image_id)
        assert !t.save, "A tag elmentődött" 
    end
end
