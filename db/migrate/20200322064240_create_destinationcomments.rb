class CreateDestinationcomments < ActiveRecord::Migration[6.0]
  def change
    create_table :destinationcomments do |t|
      t.text :body
      t.references :destination, null: false, foreign_key: true

      t.timestamps
    end
  end
end
