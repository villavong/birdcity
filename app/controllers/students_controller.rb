class StudentsController < ApplicationController
  before_action :find_student, only: [:show]



    def index
      if params[:search]
        @students = Student.search(params[:search]).paginate(:page => params[:page], :per_page => 20)
      else
        @students = Student.all.paginate(:page => params[:page], :per_page => 20)
      end
    end

    def show

    end




    private


    def find_student
      if params[:id].nil?
        @student = current_student
      else
        @student = Student.find(params[:id])
        @nowstudent = current_student

      end

    end
end
