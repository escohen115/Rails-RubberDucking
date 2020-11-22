class StudentsController < ApplicationController

  

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
    render :edit
  end

  def update
    student = Student.find(params[:id])
    student.update(strong_params)
    redirect_to student_path(student)

  end

  def create
    student = Student.create(strong_params)
    if student.valid?
      redirect_to student_path(student)
    else
      flash[:student_errors] = student.errors.full_messages
      redirect_to new_student_path
    end 
  end

  private
  def strong_params
    params.require(:student).permit(:name, :mod)
  end

end
