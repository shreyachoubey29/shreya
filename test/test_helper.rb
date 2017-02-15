ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
class CategoryTest < ActiveSupport::TestCase
    def setup
    @category = Category.new(name: "sports")
    end
    test "category should be valid" do
    assert @category.valid?
    end
    test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
    end
    test "name should be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
    end
    test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
    end
    test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
    end
    def sign_in_as(user, password)
    post login_path, session: {email: user.email, password: password}
    end
end