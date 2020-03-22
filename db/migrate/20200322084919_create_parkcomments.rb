class CreateParkcomments < ActiveRecord::Migration[6.0]
  def change
    create_table :parkcomments do |t|
      t.text :body
      t.references :park, null: false, foreign_key: true

      t.timestamps
    end
  end
end
