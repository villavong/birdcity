class ThaicommentsController < ApplicationController
  before_action :find_post, only: [:create, :edit, :update, :destroy]
  before_filter :require_permission, only: [:edit, :update, :destroy]

  before_action :authenticate_student!, only: [:create]

  def create
    @thaipost = Thaipost.find(params[:thaipost_id])

    @thaicomment = @thaipost.thaicomments.create(params[:thaicomment].permit(:comment))
    @thaicomment.student = current_student if current_student
    @thaicomment.save

    if @thaicomment.save
      redirect_to thaipost_path(@thaipost)
    else
      render 'new'
    end
  end

  def destroy
    @thaicomment = @thaipost.thaicomments.find(params[:id])
    @thaicomment.destroy
    redirect_to thaipost_path(@thaipost)
  end
  def edit
    @thaicomment = @thaipost.thaicomments.find(params[:id])
  end

  def update
    @thaicomment = @thaipost.thaicomments.find(params[:id])

    if @thaicomment.update(params[:thaicomment].permit(:comment))
      redirect_to thaipost_path(@thaipost)
    else
      render 'edit'
    end
  end

  private
  def find_post
    @thaipost = Thaipost.find(params[:thaipost_id])
  end
  def require_permission
    @thaicomment = Thaicomment.find(params[:id])
    if current_student.id != @thaicomment.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end

end
