class VietcommentsController < ApplicationController
  before_action :find_post, only: [:create, :edit, :update, :destroy]
  before_filter :require_permission, only: [:edit, :update, :destroy]

  before_action :authenticate_student!, only: [:create]

  def create
    @vietpost = Vietpost.find(params[:vietpost_id])

    @vietcomment = @vietpost.vietcomments.create(params[:vietcomment].permit(:comment))
    @vietcomment.student = current_student if current_student
    @vietcomment.save

    if @vietcomment.save
      redirect_to vietpost_path(@vietpost)
    else
      render 'new'
    end
  end

  def destroy
    @vietcomment = @vietpost.vietcomments.find(params[:id])
    @vietcomment.destroy
    redirect_to vietpost_path(@vietpost)
  end
  def edit
    @vietcomment = @vietpost.vietcomments.find(params[:id])
  end

  def update
    @vietcomment = @vietpost.vietcomments.find(params[:id])

    if @vietcomment.update(params[:vietcomment].permit(:comment))
      redirect_to vietpost_path(@vietpost)
    else
      render 'edit'
    end
  end

  private
  def find_post
    @vietpost = Vietpost.find(params[:vietpost_id])
  end
  def require_permission
    @vietcomment = Vietcomment.find(params[:id])
    if current_student.id != @vietcomment.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end

end
