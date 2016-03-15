require 'test_helper'

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(chefname: "John", email: "john@example.com")
  end

  test "chef shoul be valid" do
    assert @chef.valid?
  end

  test "chefname should be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end

  test "chef name should not be too long" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
  end

  test "test name should not be too short" do
    @chef.chefname = "aa"
    assert_not @chef.valid?
  end

  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end

  test "email length should be in bounds" do
    @chef.email = "a" * 101 + "example.com"
    assert_not @chef.valid?
  end

  test "email should be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end

  test "email validation should accept valid addresses" do
    # %w creates an "array of words" and uses whitespace to separate each value
    valid_addreses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]

    valid_addreses.each do |va|
      @chef.email = va
      assert @chef.valid?, '#{va.inspect} should be valid' # custom message in output
    end

  end


  test "email validation should reject invalid addresses" do
    invalid_addresses = %W[user@example,com user_at_eee.org user.name@example. eee@i_am.com foo@ee+aar.com]

    invalid_addresses.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, '#{ia.inspect} should be invalid'
    end

  end


end
