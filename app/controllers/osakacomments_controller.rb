class OsakacommentsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :destroy]
  before_filter :require_permission, only: [:edit, :update, :destroy]
  before_action :authenticate_student!, only: [:create]



  def create
    @osakapost = Osakapost.find(params[:osakapost_id])

    @osakacomment = @osakapost.osakacomments.create(params[:osakacomment].permit(:comment))
    @osakacomment.student = current_student if current_student
    @osakacomment.save

    if @osakacomment.save
      redirect_to osakapost_path(@osakapost)
    else
      render 'new'
    end
  end

  def destroy
    @osakacomment = @osakapost.osakacomments.find(params[:id])
    @osakacomment.destroy
    redirect_to osakapost_path(@osakapost)
  end
  def edit
    @osakacomment = @osakapost.osakacomments.find(params[:id])
  end

  def update
    @osakacomment = @osakapost.osakacomments.find(params[:id])

    if @osakacomment.update(params[:osakacomment].permit(:comment))
      redirect_to osakapost_path(@osakapost)
    else
      render 'edit'
    end
  end

  private
  def find_post
    @osakapost = Osakapost.find(params[:osakapost_id])
  end
  def require_permission
    @osakacomment = Osakacomment.find(params[:id])
    if current_student.id != @osakacomment.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end

end
