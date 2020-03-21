class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :adventures, :name, :string
  end
end
