class BeppucommentsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :destroy]
  before_filter :require_permission, only: [:edit, :update, :destroy]


	def create
    @beppupost = Beppupost.find(params[:beppupost_id])

		@beppucomment = @beppupost.beppucomments.create(params[:beppucomment].permit(:comment))
		@beppucomment.student = current_student if current_student
		@beppucomment.save

		if @beppucomment.save
			redirect_to beppupost_path(@beppupost)
		else
			render 'new'
		end
	end

	def destroy
		@beppucomment = @beppupost.beppucomments.find(params[:id])
		@beppucomment.destroy
		redirect_to beppupost_path(@beppupost)
	end
	def edit
		@beppucomment = @beppupost.beppucomments.find(params[:id])
	end

	def update
		@beppucomment = @beppupost.beppucomments.find(params[:id])

		if @beppucomment.update(params[:beppucomment].permit(:comment))
			redirect_to beppupost_path(@beppupost)
		else
			render 'edit'
		end
	end

  private
  def find_post
    @beppupost = Beppupost.find(params[:beppupost_id])
  end
  def require_permission
    @beppucomment = Beppucomment.find(params[:id])
    if current_student.id != @beppucomment.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end

end
