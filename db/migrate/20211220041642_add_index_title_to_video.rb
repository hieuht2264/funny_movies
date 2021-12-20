class AddIndexTitleToVideo < ActiveRecord::Migration[5.2]
  def change
    add_index :videos, :title
  end
end
