module Generator
  
  class XyPlane

    def initialize
      @set1, @set2 = [0,0], [0,0]
      populate_sets(@set1,@set2)
      @question = "In the (x,y) coordinate plane, if #{@set1} and #{@set2} are the points defining a line segment, what are the coordinates of the midpoint"
      generate_answers
      save_all
    end

    def populate_sets(*args)
      args.each do |set|
        set.map!  {|coordinate| coordinate = Random.rand(-40..40) }
      end
    end

    def generate_answers
      @correct_answer = [((@set1[0].to_f+@set2[0].to_f)/2).to_f,((@set1[1].to_f+@set2[1].to_f)/2).to_f]
      @wrong_answer1 = [@set1[1].to_f,@set2[1].to_f]
      @wrong_answer2 = [@set1[0]+@set2[0],@set1[1]+@set2[1]]
      @wrong_answer3 = [@set1[0]-@set2[0],@set1[1]-@set2[1]]
      @wrong_answer4 = [@set2[0],@set1[0]]
      [@correct_answer,@wrong_answer1,@wrong_answer2,@wrong_answer3,@wrong_answer4]
    end

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

end