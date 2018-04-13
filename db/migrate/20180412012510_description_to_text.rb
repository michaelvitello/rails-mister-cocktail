class DescriptionToText < ActiveRecord::Migration[5.1]
  def change
    change_column :doses, :description, :text
  end
end
