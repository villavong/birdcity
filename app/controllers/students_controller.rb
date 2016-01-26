class StudentsController < ApplicationController
  # before_action :authenticate_student!, except: [:index]

  before_action :find_student, only: [:show]



    def index
      if params[:search]
        @students = Student.search(params[:search]).paginate(:page => params[:page], :per_page => 15)
      else
        @students = Student.all.paginate(:page => params[:page], :per_page => 15)
      end
    end

    def show
      @posts = Post.find(params[:student_id]).order("created_at DESC").paginate(:page => params[:page], :per_page => 24)
    end

    private


    def find_student
      if params[:id].nil?
        @student = current_student
      else
        @student = Student.find(params[:id])

      end

    end
end
