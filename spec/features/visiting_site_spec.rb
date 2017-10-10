require 'rails_helper'

RSpec.describe "visiting the index page" do
  it "has an index page that can be visited by anyone" do
    visit root_path
    expect(page.status_code).to eq(200)
  end
end
