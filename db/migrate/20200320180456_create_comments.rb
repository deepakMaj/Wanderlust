class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.references :adventure, null: false, foreign_key: true
    end
  end
end
