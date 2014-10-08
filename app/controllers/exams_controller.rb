class ExamsController < ApplicationController

  def new
    @exam = Exam.new    
  end

  def index
    @exams = Exam.all
  end

  def create
    @exam = Exam.new(exam_params)
    if @exam.save
      flash[:success] = "Exam #{@exam.title} saved!"
      render :new
    end
  end

  def edit
    @exam = Exam.find(params[:id])
  end

  def update
    @exam = Exam.find(params[:id])
    if @exam
      @exam.update_attributes(exam_params)
      flash[:success] = "Exam has been updated!"
      redirect_to exams_path
    end
  end

  private

  def exam_params
    params.require(:exam).permit!
  end

end