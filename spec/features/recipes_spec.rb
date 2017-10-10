require 'rails_helper'

RSpec.describe "navigating" do

  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)
  end

  describe "index" do
    before do
      visit root_path
    end
    it "can be reached successfully" do
      expect(page.status_code).to eq(200)
    end

    it "has a title" do
      expect(page).to have_content("Find the Perfect Aeropress Recipe")
    end

    it "has a list of recipes" do
      recipe1 = FactoryGirl.build_stubbed(:recipe)
      recipe2 = FactoryGirl.build_stubbed(:recipe)
      visit root_path
      expect(page).to have_content(/A title|A description/)
    end
  end

  describe "new" do
    it "it has a nav link to the new recipe form" do
      visit root_path
      click_link("new_recipe_from_nav")
      expect(page.status_code).to eq(200)
      expect(page).to have_content("New Recipe")
    end

    it "cannot be reached if the user is signed out" do
      logout(:user)
      visit new_recipe_path
      expect(current_path).to eq(new_user_session_path)
    end
  end

  describe "delete" do
    it "can be deleted" do
      @recipe = FactoryGirl.create(:recipe)
      visit recipe_path(@recipe)
      click_link("delete_recipe_#{@recipe.id}")
      expect(page.status_code).to eq(200)
    end
  end

  describe "creation" do
    before do
      visit new_recipe_path
    end

    it "has a form that can be reached" do
      expect(page.status_code).to eq(200)
    end

    it "can be created from the new form page" do
      fill_in "recipe[title]", with: "A great test title"
      fill_in "recipe[description]", with: "A description"
      fill_in "recipe[youtube_id]", with: "PMqjk2jZ4AE"
      click_on "Submit Recipe"
      expect(page).to have_content("A great test title")
    end

    it "can be created from the new form page" do
      fill_in "recipe[title]", with: "A creation test title"
      fill_in "recipe[description]", with: "A description"
      fill_in "recipe[youtube_id]", with: "PMqjk2jZ4AE"
      click_on "Submit Recipe"
      expect(User.last.recipes.last.title).to eq("A creation test title")
    end
  end

  describe "edit" do
    before do
      @recipe = FactoryGirl.create(:recipe)
    end

    it "can be reached by clicking edit on the show page" do
      visit recipe_path(@recipe)

      click_link("edit_#{@recipe.id}")
      expect(page.status_code).to eq(200)
      expect(current_path).to eq(edit_recipe_path(@recipe.id))
    end

    it "can be edited" do
      visit edit_recipe_path(@recipe)

      fill_in "recipe[title]", with: "An edited title"
      fill_in "recipe[description]", with: "An edited description"
      fill_in "recipe[youtube_id]", with: "AYTIDWITHNW"

      click_on "Submit Recipe"
      expect(page).to have_content("An edited title")
    end
  end
end
