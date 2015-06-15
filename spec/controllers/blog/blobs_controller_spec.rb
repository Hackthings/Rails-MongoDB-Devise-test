require 'rails_helper'

RSpec.describe Blog::BlobsController do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET #index" do

    it "should assign all blobs as @blobs" do
      Blog::Blob.create(:title => "title", :body => "text")
      get :index
      expect(assigns(:blobs))
    end

  end

  describe "GET #new" do

    it "should assign a new blob to @blob" do
      get :new
      expect(assigns(:blob)).to be_a_new(Blog::Blob)
    end

  end

  describe "POST #create" do

    describe "with valid params" do

      before(:each) do
        @blob = { :title => "title", :body  => "do what you want with my body" }
        post :create, :blob => @blob
      end

      it "should create a valid blob" do
        expect(assigns(:blob)).to be_a_valid(Blog::Blob)
      end

      it "should redirect to the blob show page" do
        expect(response).to redirect_to(blog_blob_path assigns(:blob))
      end

      it "should pass params to blob" do
        expect(assigns(:blob).title).to eq("title")
        expect(assigns(:blob).body).to eq("do what you want with my body")
      end

    end

    describe "with invalid params" do

      before(:each) do
        post :create
      end

      it "should not be validated" do
        expect(assigns[:blob]).to_not be_a_valid(Blog::Blob)
      end

      it "should rerender new on failed save" do
        expect(response).to render_template(:new)
      end

    end

  end

  describe "PUT #update" do

    describe "with valid params" do

      before(:each) do
        @blob = Blog::Blob.create(:title => "title", :body => "text")
        @blob.save
        @params = { :title => "new title", :body  => "new body" }
        put :update, :id => @blob.id, :blob => @params
      end

      it "should redirect to the show page for the created blob" do
        expect(response).to redirect_to(blog_blob_path assigns(:blob))
      end

      xit "should change the content" do

      end

    end

    describe "with invalid params" do

      before(:each) do
        @blob = Blog::Blob.create(:title => "title", :body => "text")
        @blob.save
        @params = { :title => nil, :body  => "new body" }
        put :update, :id => @blob.id, :blob => { :title => "new title", :body  => "new body" }
      end

      xit "should render the edit template" do
        expect(response).to render_template(:edit_blog_blob)
      end

    end

  end

  describe "DELETE #destroy" do

    xit "should remove the blob" do

    end

    xit "should redirect to the blobs index page" do
      expect(response).to redirect_to(:new_blog_blob)
    end

  end

end
