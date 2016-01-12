class FukuokacommentsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :destroy]
  before_filter :require_permission, only: [:edit, :update, :destroy]


  def create
    @fukuokapost = Fukuokapost.find(params[:fukuokapost_id])

    @fukuokacomment = @fukuokapost.fukuokacomments.create(params[:fukuokacomment].permit(:comment))
    @fukuokacomment.student = current_student if current_student
    @fukuokacomment.save

    if @fukuokacomment.save
      redirect_to fukuokapost_path(@fukuokapost)
    else
      render 'new'
    end
  end

  def destroy
    @fukuokacomment = @fukuokapost.fukuokacomments.find(params[:id])
    @fukuokacomment.destroy
    redirect_to fukuokapost_path(@fukuokapost)
  end
  def edit
    @fukuokacomment = @fukuokapost.fukuokacomments.find(params[:id])
  end

  def update
    @fukuokacomment = @fukuokapost.fukuokacomments.find(params[:id])

    if @fukuokacomment.update(params[:fukuokacomment].permit(:comment))
      redirect_to fukuokapost_path(@fukuokapost)
    else
      render 'edit'
    end
  end

  private
  def find_post
    @fukuokapost = Fukuokapost.find(params[:fukuokapost_id])
  end
  def require_permission
    @fukuokacomment = Fukuokacomment.find(params[:id])
    if current_student.id != @fukuokacomment.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end

end
