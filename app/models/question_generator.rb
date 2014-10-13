class QuestionGenerator

  attr_reader :correct_answer, :wrong_answer1, :wrong_answer2, :wrong_answer3, :wrong_answer4

  def initialize
    @correct_answer,@wrong_answer1,@wrong_answer2,@wrong_answer3=[],@wrong_answer4 = []
    @set1 = []
    @set2 = [] 
    @correct_answer = []
    @set1[0] = Random.rand(-20..20)
    @set1[1] = Random.rand(-20..20)
    @set2[0] = Random.rand(-20..20)
    @set2[1] = Random.rand(-20..20)
    @question = "In the (x,y) coordinate plane, if #{@set1} and #{@set2} are the points defining a line segment, what are the coordinates of the midpoint"
    save_question
    generate_answers
  end

  def initialize(question_format,amount)
    @question = CannedQuestion.find(question_format)
    @amount = amount
  end

  private

  def generate_answers
    @correct_answer = [((@set1[0]+@set2[0])/2).to_f,((@set1[1]+@set2[1])/2).to_f]
    # correct_answer = (@set1[1]+@set2[1])/2
    @wrong_answer1 = [@set1[1],@set2[1]]
    @wrong_answer2 = [@set1[0]+@set2[0],@set1[1]+@set2[1]]
    @wrong_answer3 = [@set1[0]-@set2[0],@set1[1]-@set2[1]]
    @wrong_answer4 = [@set2[0],@set1[0]]
  end

  def save_question
    question = Question.new(body: @question)
    question.save
  end


end