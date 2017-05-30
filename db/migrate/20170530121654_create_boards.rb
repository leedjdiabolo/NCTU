class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.string :title
      t.text :content
      t.date :date

      t.timestamps
    end
  end
end
