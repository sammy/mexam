class AnswersController < ApplicationController

  before_filter :check_session

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new    
  end

  def create
    @answer = Answer.new(answer_params.merge(question_id: params[:question_id]))
    @question = Question.find(params[:question_id])
    @answer.save
    flash[:success] = "Answer '#{@answer.body.downcase}' added!"
    redirect_to new_question_answer_path(@question)
  end

  def preview
    @answer = Answer.find(params[:answer_id])
    if @answer.is_correct
      flash[:success] = "#{@answer.body} is correct!"
    else
      flash[:alert] = "#{@answer.body} <strong>is not correct!!</strong><br> Try again..."
    end
      redirect_to preview_question_path(Question.find(params[:question_id]))
  end

  private

  def answer_params
    params.require(:answer).permit!
  end

end