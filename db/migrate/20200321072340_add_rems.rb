class AddRems < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :created_at, :datetime
    add_column :comments, :updated_at, :datetime
    remove_column :comments, :name
  end
end
