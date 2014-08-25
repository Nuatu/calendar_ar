class CreateNote < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :description
      t.references :doable, polymorphic: true

      t.timestamps
    end
  end
end
