class BeppupostsController < ApplicationController
  before_action :require_permission, only: [:edit, :update, :destroy]

  before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_student!

  def index
    @beppuposts = Beppupost.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
  end

  def show
  end

  def new
    @beppupost = current_student.beppuposts.build
  end
  def create
    @beppupost = current_student.beppuposts.build(post_params)

    if @beppupost.save
      redirect_to @beppupost
    else
      render 'new'
    end
  end
  def edit
  end

  def update
		if @beppupost.update (post_params)
			redirect_to @beppupost
		else
			render 'edit'
		end

	end


  def destroy
    @beppupost.destroy
    redirect_to beppuposts_path
  end

  private

  def find_post
    @beppupost = Beppupost.find(params[:id])
  end


  def post_params
    params.require(:beppupost).permit(:title, :content, :photo)
  end
  def require_permission
    @beppupost = Beppupost.find(params[:id])
    if current_student.id != @beppupost.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end
end
