class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :slug
      t.string :identifier_stable
      t.string :identifier_temp
      t.string :type
      t.jsonb :type_properties
      t.integer :parent_id
      t.text :remarks

      t.timestamps
    end
  end
end
