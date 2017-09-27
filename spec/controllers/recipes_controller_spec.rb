require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  it 'displays recipes on homepage' do
    get 'index'
    expect(response).to be_successful
  end



end
