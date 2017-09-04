require 'rails_helper'
require "cancan/matchers"

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @attr = FactoryGirl.attributes_for(:user)
    @model = @user
    @entity = 'User'
    @path = users_path
  end

  include_examples "permission_controller"
end
