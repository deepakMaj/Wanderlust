class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.string :url
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
