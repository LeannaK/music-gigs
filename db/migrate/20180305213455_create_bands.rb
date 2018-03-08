class CreateBands < ActiveRecord::Migration[5.1]
  def change
    create_table :bands do |t|
      t.belongs_to :user
      t.string :name
      t.string :genre
      t.string :location
      t.string :poc
      t.string :phone
      t.string :email
      t.string :description
      t.string :link

      t.timestamps
    end
  end
end
