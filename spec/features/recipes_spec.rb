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
      recipe1 = FactoryGirl.create(:recipe)
      recipe2 = FactoryGirl.create(:recipe)
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

  describe "editing recipes" do
    before do
      @recipe = FactoryGirl.create(:recipe)
      logout(@user)
      @admin = FactoryGirl.create(:admin_user)
      login_as(@admin, scope: :user)
    end

    it "can be reached by an admin by clicking edit on the show page" do
      visit recipe_path(@recipe)

      click_link("edit_#{@recipe.id}")
      expect(page.status_code).to eq(200)
      expect(current_path).to eq(edit_recipe_path(@recipe.id))
    end

    it "can be edited by an admin" do
      visit edit_recipe_path(@recipe)
      fill_in "recipe[title]", with: "An edited title"
      fill_in "recipe[description]", with: "An edited description"
      fill_in "recipe[youtube_id]", with: "AYTIDWITHNW"

      click_on "Submit Recipe"
      expect(page).to have_content("An edited title")
    end
  end

  describe "delete" do
    it "can't be deleted by a normal user" do
      @recipe = FactoryGirl.create(:recipe)
      visit recipe_path(@recipe)
      expect{ click_link("delete_recipe_#{@recipe.id}")}.to change(Recipe, :count).by(0)
    end

    it "can be deleted by an admin user" do
      @recipe = FactoryGirl.create(:recipe)
      logout(@user)
      @admin = FactoryGirl.create(:admin_user)
      login_as(@admin, scope: :user)
      visit recipe_path(@recipe)
      expect{ click_link("delete_recipe_#{@recipe.id}")}.to change(Recipe, :count).by(-1)
    end
  end
end
