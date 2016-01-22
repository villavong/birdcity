class FukuokapostsController < ApplicationController
  before_action :require_permission, only: [:edit, :update, :destroy]

  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_student!, only: [:new, :create]

  def index
    if params[:search]
      @fukuokaposts = Fukuokapost.search(params[:search]).paginate(:page => params[:page], :per_page => 25)
    else
      @fukuokaposts = Fukuokapost.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 25)
    end
  end

  def show
  end

  def new
    @fukuokapost = current_student.fukuokaposts.build
  end
  def create
    @fukuokapost = current_student.fukuokaposts.build(post_params)

    if @fukuokapost.save
      redirect_to @fukuokapost
    else
      render 'new'
    end
  end
  def edit
  end

  def update
    if @fukuokapost.update (post_params)
      redirect_to @fukuokapost
    else
      render 'edit'
    end

  end


  def destroy
    @fukuokapost.destroy
    redirect_to fukuokaposts_path
  end

  private

  def find_post
    @fukuokapost = Fukuokapost.find(params[:id])
  end


  def post_params
    params.require(:fukuokapost).permit(:title, :content, :photo)
  end
  def require_permission
    @fukuokapost =Fukuokapost.find(params[:id])
    if current_student.id != @fukuokapost.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end
end
