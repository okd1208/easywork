class AddProgressToPrivatetasks < ActiveRecord::Migration[5.2]
  def change
    add_column :privatetasks, :progress, :datetime
  end
end
