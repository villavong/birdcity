class StudentsController < ApplicationController
  before_action :find_student, only: [:show]



    def index
      if params[:search]
        @students = Student.search(params[:search])
      else
        @students = Student.all
      end
    end
    def autocomplete
        render json: Student.search(params[:term], fields: [{school: :text_start}], limit: 10).map(&:school)
        # render json: Student.search(params[:term], fields: [{name: :text_start}], limit: 10).map(&:name)
        # render json: Student.search(params[:term], fields: [{city: :text_start}], limit: 10).map(&:city)
    end

    def show

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
