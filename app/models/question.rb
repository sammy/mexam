class Question < ActiveRecord::Base

  mount_uploader :question_image, QuestionImageUploader

  belongs_to :chapter
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers

  after_validation :sanitize!

  def sanitize!
    while body[body.length - 1] == '?'
      body.slice!(body.length - 1) 
    end
  end

  def easy?
    difficulty.between?(1,2)
  end

  def normal?
    difficulty == 3
  end

  def hard?
    difficulty.between?(4,5)
  end

  def self.import(file)
    data = CsvParser.new(file).data
    data.each do |csv_row|
      chapter = Chapter.where(codename: csv_row["chapter"]).first
      question = Question.create!(body: csv_row["question_body"], difficulty: csv_row["difficulty"], chapter_id: chapter.id)
      [csv_row["wrong_answer1"], csv_row["wrong_answer2"], csv_row["wrong_answer3"], csv_row["wrong_answer4"]].each do |answer|
        Answer.create!(body: answer, question_id: question.id, is_correct: false)
      end
      Answer.create!(body: csv_row["correct_answer"], question_id: question.id, is_correct: true)
    end
  end

end