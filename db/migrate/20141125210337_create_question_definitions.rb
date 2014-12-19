class CreateQuestionDefinitions < ActiveRecord::Migration
  def change
    create_table :question_definitions do |t|
      t.string :question_text
      t.hstore :variables
      t.string :first_answer
      t.string :second_answer
      t.string :third_answer
      t.string :correct_answer
      t.timestamps
    end
  end
end
