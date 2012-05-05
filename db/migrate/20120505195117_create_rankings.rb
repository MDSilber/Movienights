class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.integer :user_id
      t.integer :suggestion_id

      t.timestamps
    end
  end
end
