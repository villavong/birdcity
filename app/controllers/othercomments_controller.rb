class OthercommentsController < ApplicationController
  before_action :find_post, only: [:create, :edit, :update, :destroy]
  before_filter :require_permission, only: [:edit, :update, :destroy]
  before_action :authenticate_student!, only: [:create]


  def create
    @otherpost = Otherpost.find(params[:otherpost_id])

    @othercomment = @otherpost.othercomments.create(params[:othercomment].permit(:comment))
    @othercomment.student = current_student if current_student
    @othercomment.save

    if @othercomment.save
      redirect_to otherpost_path(@otherpost)
    else
      render 'new'
    end
  end

  def destroy
    @othercomment = @otherpost.othercomments.find(params[:id])
    @othercomment.destroy
    redirect_to otherpost_path(@otherpost)
  end
  def edit
    @othercomment = @otherpost.othercomments.find(params[:id])
  end

  def update
    @othercomment = @otherpost.othercomments.find(params[:id])

    if @othercomment.update(params[:othercomment].permit(:comment))
      redirect_to otherpost_path(@otherpost)
    else
      render 'edit'
    end
  end

  private
  def find_post
    @otherpost = Otherpost.find(params[:otherpost_id])
  end
  def require_permission
    @othercomment = Othercomment.find(params[:id])
    if current_student.id != @othercomment.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end

end
