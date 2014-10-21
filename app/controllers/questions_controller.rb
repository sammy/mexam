class QuestionsController < ApplicationController

  before_filter :check_session

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to new_question_answer_path(@question)
      flash[:success] = 'Question saved!'
    else
      flash[:alert] = 'Something went wrong!'
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question
      @question.update_attributes(question_params)
      flash[:success] = "Question updated!"
      redirect_to home_path
    end
    # binding.remote_pry
  end

  def preview
    @question = Question.find(params[:question_id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy if @question
    redirect_to home_path
    flash[:success] = "Question has been deleted."
  end

  def import
    data = Question.import(params[:file])
    message = []
    message << "#{data.count} questions imported!<br/>"
    data.each { |q| message << "#{q["question_body"]} -> <strong>#{q["chapter"]}</strong>"}
    flash[:success] = message.join('<br/>').html_safe 
    redirect_to home_path
  end

  private

  def question_params
    params.require(:question).permit!
  end

end
