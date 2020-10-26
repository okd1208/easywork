class CreatePrivatetasks < ActiveRecord::Migration[5.2]
  def change
    create_table :privatetasks do |t|
      t.string :task
      t.datetime :deadline
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
