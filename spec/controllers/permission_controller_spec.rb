require 'rails_helper'

RSpec.describe PermissionsController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @permission = FactoryGirl.create(:permission, entity: 'Permission', user: @user)
    sign_in @user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
