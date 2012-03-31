class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
#t.name :string
#     t.date :datetime
#     t.location :string

      t.timestamps
    end
  end
end
