class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.integer :movie_id
      t.integer :event_id

      t.timestamps
    end
  end
end
