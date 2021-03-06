class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.belongs_to :blog, index: true
      t.timestamps
    end
  end
end
