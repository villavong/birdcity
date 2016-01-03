class StudentcommentsController < ApplicationController
    before_action :find_student, only: [:edit, :update, :destroy]
    before_filter :require_permission, only: [:edit, :update, :destroy]


  	def create
      @student = Student.find(params[:student_id])

  		@studentcomment = @student.studentcomments.create(params[:studentcomment].permit(:comment))
  		@studentcomment.student = current_student if current_student
  		@studentcomment.save

  		if @studentcomment.save
  			redirect_to student_path(@student)
  		else
  			render 'new'
  		end
  	end

  	def destroy
  		@studentcomment = @student.studentcomments.find(params[:id])
  		@studentcomment.destroy
  		redirect_to student_path(@student)
  	end
  	def edit
  		@studentcomment = @student.studentcomments.find(params[:id])
  	end

  	def update
  		@studentcomment = @student.studentcomments.find(params[:id])

  		if @studentcomment.update(params[:studentcomment].permit(:comment))
  			redirect_to student_path(@student)
  		else
  			render 'edit'
  		end
  	end

    private
    def find_student
      @student = Student.find(params[:student_id])
    end
    def require_permission
      @studentcomment = Studentcomment.find(params[:id])
      if current_student.id != @studentcomment.student_id
        redirect_to root_path, notice: "Sorry, you're not allowed"
      end

    end


end