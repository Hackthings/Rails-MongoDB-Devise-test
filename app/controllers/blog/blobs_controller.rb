
class Blog::BlobsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :set_blob, only: [:show, :update, :edit, :destroy]

  def index
    @blobs = Blog::Blob.all
  end

  def new
    @blob = Blog::Blob.new
  end

  def create
    @blob = Blog::Blob.new(blob_params)
    redirect_to_blob_on(@blob.save,
                        :error_template => :new,
                        :notice => 'Blog post successfully created.')
  end

  def update
    redirect_to_blob_on(@blob.update(blob_params),
                        :error_template => :edit,
                        :notice => 'Blog post saved.')
  end

  def destroy
    @blob.destroy!

    respond_to do |format|
      format.html { redirect_to blog_blobs_url, notice: 'Blog post successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  def set_blob
    @blob = Blog::Blob.find(params[:id])
  end

  def blob_params
    b = params[:blob]
    b.permit(:title, :body) if b
  end

  def redirect_to_blob_on(condition, error_template: nil, notice: '')
    respond_to do |format|
      if condition
        format.html { redirect_to @blob, notice: notice }
        format.json { render :show, status: :created, location: @blob }
      else
        format.html { render error_template }
        format.json { render json: @blob.errors, status: :unprocessable_entity }
      end
    end
  end
end
