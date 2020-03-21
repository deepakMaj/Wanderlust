class ChnageColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :adventures, :hashtags, :tags
  end
end
