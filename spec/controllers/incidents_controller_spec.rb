require 'rails_helper'

RSpec.describe IncidentsController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @attr = FactoryGirl.attributes_for(:incident)
    @model = FactoryGirl.create(:incident)
    @entity = 'Incident'
    @path = incidents_path
  end

  include_examples "permission_controller"
end
