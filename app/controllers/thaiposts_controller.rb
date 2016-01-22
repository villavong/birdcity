class ThaipostsController < ApplicationController
  before_filter :require_permission, only: [:edit, :update, :destroy]

  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_student!, only: [:new, :create]
  def index
    if params[:search]
      @thaiposts = Thaipost.search(params[:search]).paginate(:page => params[:page], :per_page => 25)
    else
      @thaiposts = Thaipost.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 25)
    end
  end

  def show
  end

  def new
    @thaipost = current_student.thaiposts.build
  end
  def create
    @thaipost = current_student.thaiposts.build(post_params)

    if @thaipost.save
      redirect_to @thaipost
    else
      render 'new'
    end
  end
  def edit
  end

  def update
    if @thaipost.update (post_params)
      redirect_to @thaipost
    else
      render 'edit'
    end

  end


  def destroy
    @thaipost.destroy
    redirect_to thaiposts_path
  end

  private

  def find_post
    @thaipost = Thaipost.find(params[:id])
  end


  def post_params
    params.require(:thaipost).permit(:title, :content, :photo)
  end
  def require_permission
    @thaipost = Thaipost.find(params[:id])
    if current_student.id != @thaipost.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end

end
