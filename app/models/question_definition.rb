class QuestionDefinition < ActiveRecord::Base

  def persist
    create_instance_variables
    create_and_save_question
    create_and_save_answers
  end

  def create_instance_variables
    variables.each do |key,value|
      instance_variable_set("@#{key}", eval("#{value}"))
    end
  end

  def create_and_save_question
    @generated_text = question_text.dup
    binding.pry
    variables.each do |key,value|
      @generated_text.gsub!("@#{key}", eval("@#{key}").to_s)
    end
    @question = Question.new(body: @generated_text, chapter_id: chapter_id)
    @question.save
  end

  def create_and_save_answers
    Answer.new(body: eval(first_answer),   question_id: @question.id, is_correct: false).save
    Answer.new(body: eval(second_answer),  question_id: @question.id, is_correct: false).save
    Answer.new(body: eval(third_answer),   question_id: @question.id, is_correct: false).save
    Answer.new(body: eval(correct_answer), question_id: @question.id, is_correct:  true).save
  end
end