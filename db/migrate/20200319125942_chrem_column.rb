class ChremColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :adventures, :tags
  end
end
