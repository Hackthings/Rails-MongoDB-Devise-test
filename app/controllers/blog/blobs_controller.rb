
class Blog::BlobsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :set_blob, only: [:show, :update, :edit]

  def index
    @blobs = Blog::Blob.all
  end

  def new
    @blob = Blog::Blob.new
  end

  def create
    @blob = Blog::Blob.new(blob_params)
    render_blob_on(@blob.save, :error_template => :new)
  end

  def update
    render_blob_on(@blob.save, :error_template => :edit)
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
    b = params[:blob]
    b.permit(:title, :body)
  end

  def render_blob_on(condition, error_template: nil)
    respond_to do |format|
      if condition
        format.html { redirect_to @blob, notice: 'Blog post successfully created.'}
        format.json { render :show, status: :created, location: @blob }
      else
        format.html { render error_template }
        format.json { render json: @blob.errors, status: :unprocessable_entity }
      end
    end
  end
end
