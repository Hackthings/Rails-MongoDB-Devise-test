class Blog::BlobsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  
    def index
       @blobs = Blog::Blob.all
    end
    
    def new
      @blob = Blog::Blob.new
    end
    
    def edit
      @blob = Blog::Blob.find(params[:id])
    end
    
    def create
      @blob = Blog::Blob.new(blob_params)
      
      respond_to do |format|
        if @blob.save
            format.html { redirect_to @blob, notice: 'Blog post successfully created.'}
            format.json { render :show, status: :created, location: @blob }
        else
            format.html { render :new }
            format.json { render json: @blob.errors, status: :unprocessable_entity }
        end
      end
    end
    
    def update
      @blob = Blog::Blob.find(params[:id])
      
      respond_to do |format|
          if @blob.update(blob_params)
            format.html { redirect_to @blob, notice: 'Blog post successfully updated.' }
            format.json { render :show, status: :created, location: @blob }
          else
            format.html { render :edit }
            format.json { render json: @blob.errors, status: :unprocessable_entity }
          end
      end
    end
    
    def show
        set_blob
    end
    
    def destroy
      @blob.destroy!
      
      respond_to do |format|
         format.html { redirect_to blog_blog_url, notice: 'Blog post successfully deleted.' }
         format.json { head :no_content }
      end
    end
    
    private
    def set_blob
        @blob = Blog::Blob.find(params[:id])
    end
    
    def blob_params
      params.require(:blob).permit(:title, :body)
    end
end
