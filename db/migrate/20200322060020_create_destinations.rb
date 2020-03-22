class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :name
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
