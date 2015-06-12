require 'rails_helper'

RSpec.describe Blog::BlobsController, type: :controller do

  describe "GET #index" do

    it "should assign all blobs as @blobs" do
      blob = Blog::Blob.create!
      get :index, {}
      expect(assigns(:blobs))
    end

  end

  describe "GET #new" do

    it "should assign a new blob to @blob" do
      get :index, {}
      expect(assigns(:blob))
    end

  end

  # describe "POST #create" do

  #   it "should redirect to the show page for the created blob" do
  #     allow_any_instance_of(Blog::Blob).to receive(:valid?).and_return(true)
  #     post :create, :blob => {:title => "title", :body  => "do what you want with my body"}
  #     expect(assigns(:blob)).to be_a_new(Blog::Blob)
  #     expect(response).to redirect_to(blog_blob)
  #   end

  #   it "should rerender new on failed save" do
  #     allow_any_instance_of(Blog::Blob).to receive(:valid?).and_return(false)
  #     post :create
  #     expect(assigns[:blob]).to_not be_a_new(Blog::Blob)
  #     expect(response).to render_template(:new)
  #   end

  #   it "should pass params to blob" do
  #     @blob = {
  #       :title => "title",
  #       :body  => "do what you want, what you want with my body"
  #     }
  #     post :create, :blob => @blob
  #     expect(assigns(:blob).title).to == "title"
  #     expect(assigns(:blob).body).to == "do what you want, what you want with my body"
  #   end

  # end

end
