require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  # we first wrote a test which fails for a desired functionality,
  # then we wrote some code which adds the functionality and finally
  # we ensured that our test passes. TDD.

  def setup

    @chef = Chef.create(chefname: "bob", email: "bob@example.com")

    @recipe = @chef.recipes.build(name: "Chicken parm", summary: "this is the best checken parm recipe ever",
              description: "heat oil, add onions, add tomato souce, cook for 20 minutes")
              # it will pass the test of uniquness for email,
              # because its hitting a database in sandbox

    # after we make a association to Chef,
    # creation of recipe this way is no longer needed
    # @recipe = Recipe.new(name: "Chicken parm", summary: "this is the best checken parm recipe ever",
    #          description: "heat oil, add onions, add tomato souce, cook for 20 minutes")

    # we build it through chef now, because of association
    @recipe = @chef.recipes.build(name: "Chicken parm", summary: "this is the best checken parm recipe ever",
              description: "heat oil, add onions, add tomato souce, cook for 20 minutes")

  end

  # tests
  test "recipe should be valid" do
    assert @recipe.valid?
  end


  # after we added chef_id association to recipes
  # we must test if chef_id is present because without it
  # recipe cannot be created at constructor setup
  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end


  test "name should be present" do
    @recipe.name = "" # assigning something that should fail
    assert_not @recipe.valid?
  end

  test "name length should not be too long" do
    @recipe.name = "a" * 101 # assigning something that should fail
    assert_not @recipe.valid?
  end

  test "name lenght should not be too short" do
    @recipe.name = "aaaa" # assigning something that should fail
    assert_not @recipe.valid?
  end

  test "summary should be present" do
    @recipe.summary = " " # if summary is empty..
    assert_not @recipe.valid? # ..claim its FALSE @recipe.valid?
  end

  test "summary lenght should not be too long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end

  test "summary length should not be too short" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end

  test "description must be present" do
    @recipe.description = " " # if description is empty..
    assert_not @recipe.valid? # ..claim its FALSE @recipe.valid?
  end

  test "description should not be too long" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end

  test "description should not be too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end




end
