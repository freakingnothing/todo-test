class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.integer :taggable_id
      t.string :taggable_type
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
