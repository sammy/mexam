class Chapter < ActiveRecord::Base

  belongs_to :exam
  has_many :questions
  has_many :subchapters,  class_name:   "Chapter",
                          foreign_key:  "headchapter_id"
  belongs_to :headchapter, class_name:  "Chapter"

  def self.main_chapters
    where(headchapter_id: nil)
  end

  def weight_percent
    weight == nil ? "N/A" : "#{weight}%"
  end

  def number_of_questions
    "#{questions.count} questions"
  end
end