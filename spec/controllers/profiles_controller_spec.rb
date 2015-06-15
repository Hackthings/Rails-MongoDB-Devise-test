require 'rails_helper'

RSpec.describe ProfilesController, :type => :controller do

  describe "GET #index" do

    describe "when not logged in" do

      it "should redirect to new user page" do
        sign_out :user
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end

    end

    describe "when logged in" do

      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = FactoryGirl.create(:user)
        sign_in @user
        get :index
      end

      it "should succeed" do
        assert_response :success
      end

      it "should return current user" do
        expect(assigns(:user)).to eq(@user)
      end

    end

  end

  describe "Show" do

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      get :show, :id => @user.id
    end

    it "should succeed" do
      assert_response :success
    end

    it "should show the correct user" do
      expect(assigns(:user)).to eq(@user)
    end

  end

end
