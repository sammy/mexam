class Question < ActiveRecord::Base

  mount_uploader :question_image, QuestionImageUploader

  belongs_to :chapter
  has_many :answers, dependent: :destroy

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

end