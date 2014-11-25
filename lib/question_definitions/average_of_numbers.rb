class AverageOfNumbers
  include Persistable
  def initialize
    @a, @b = Random.rand(3..10), Random.rand(3..20)
    @question = "The average of #{@a} numbers is #{@b}. What is the sum of these numbers?"
    generate_answers
    save_all
  end
  def generate_answers
    @correct_answer = @a * @b
    @wrong_answer1 = @a * @a
    @wrong_answer2 = (@a * @b)/2
    @wrong_answer3 = @a + @b
    @wrong_answer4 = @b 
  end
end