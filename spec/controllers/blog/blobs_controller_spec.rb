require 'rails_helper'

RSpec.describe Blog::BlobsController, type: :controller do
    describe "GET #index" do
    it "assigns all blobs as @blobs" do
      blob = Blog::Blob.create!
      get :index, {}
      expect(assigns(:blobs))
    end
  end
end
