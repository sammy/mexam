require 'question_definitions/average_of_numbers'


module CookieCutter
  
  class XyPlane
    include Persistable
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
  end

  module ACT
    module PreAlgebra
      AverageOfNumbers = ::AverageOfNumbers
    end
  end


end