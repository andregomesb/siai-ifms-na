require 'rails_helper'
require "cancan/matchers"

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  describe "GET #index" do
    it "returns http success if have acess permission" do
      add_permission 'User', @user
      sign_in @user
      get :index
      expect(response).to have_http_status(:success)
    end

    it "not returns http success if have acess permission" do
      sign_in @user
      get :index
      expect(response).not_to have_http_status(:success)
    end
  end
end
