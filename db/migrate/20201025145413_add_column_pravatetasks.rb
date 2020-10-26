class AddColumnPravatetasks < ActiveRecord::Migration[5.2]
  def change
    add_column :privatetasks, :category, :string
  end
end
