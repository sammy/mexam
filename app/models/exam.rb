class Exam < ActiveRecord::Base

  require "csv"

  has_many :chapters

  def self.import(file)
    data = CsvParser.new(file).data
    data.each do |csv_row|
      exam =  Exam.where(title: csv_row["Exam"]).first
      chapter = Chapter.where(name: csv_row["chapter_title"])

      if !exam
        exam = Exam.create!(title: csv_row["Exam"])
      end

      if chapter.count == 0
        if csv_row["parent_chapter_code"] == nil
          Chapter.create!(  name: csv_row["chapter_title"],
                            weight: csv_row["weight"],
                            codename: csv_row["chapter_code"],
                            exam_id: exam.id )

        elsif csv_row["parent_chapter_code"] != nil
          parent_chapter = Chapter.where(codename: csv_row["parent_chapter_code"]).first
          Chapter.create!(  name: csv_row["chapter_title"], 
                            weight: csv_row["weight"],
                            codename: csv_row["chapter_code"], 
                            exam_id: exam.id, 
                            headchapter_id: parent_chapter.id )
        end
      end
    end
  end

end