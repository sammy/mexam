module Persistable

  def save_all
    question = Question.new(body: @question, chapter_id: 1, difficulty: 3)
    if question.save
      correct_answer = Answer.new(body: @correct_answer.to_s, question_id: question.id, is_correct: true)
      correct_answer.save
      [@wrong_answer1,@wrong_answer2,@wrong_answer3,@wrong_answer4].each do |answer|
        wrong_answer = Answer.new(body: answer.to_s, question_id: question.id, is_correct: false)
        wrong_answer.save
      end
    end
  end

end