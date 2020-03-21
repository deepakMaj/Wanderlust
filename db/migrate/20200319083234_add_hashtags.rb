class AddHashtags < ActiveRecord::Migration[6.0]
  def change
    add_column :adventures, :hashtags, :string
  end
end
