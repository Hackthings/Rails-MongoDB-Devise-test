require 'rails_helper'
require 'pp'

RSpec.describe ProfilesController, :type => :controller do

  describe "GET #index" do

    # when not logged in
    it "should redirect to new user page" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end

    # when logged in
    it "should return current user" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      sign_in @user
      assert_response :success
      expect{ get :index }.to change{ assigns(:user) }.to(@user.id)
    end

  end

  describe "Show" do

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
    end

    it "should get show" do
      get :show, :id => @user.id
      assert_response :success
    end

    it "should show the correct user" do
      expect{ get :show, :id => @user.id }.to change{ assigns(:user) }.to(@user)
    end

  end

end
