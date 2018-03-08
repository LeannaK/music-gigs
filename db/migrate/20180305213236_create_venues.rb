class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.belongs_to :user
      t.string :name
      t.string :location
      t.string :address
      t.string :phone
      t.string :email
      t.string :poc
      t.string :description
      t.string :link
      t.timestamps
    end
  end
end
