class Chapter < ActiveRecord::Base

  belongs_to :exam
  has_many :questions

end