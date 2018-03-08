class CreateGigs < ActiveRecord::Migration[5.1]
  def change
    create_table :gigs do |t|
      t.belongs_to :venue
      t.string :name
      t.date :date
      t.time :time
      t.string :band
      t.string :cost
      t.string :description
      t.string :link

      t.timestamps
    end
  end
end
