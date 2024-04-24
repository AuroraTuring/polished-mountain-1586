class CreateExperiments < ActiveRecord::Migration[7.1]
  def change
    create_table :experiments do |t|
      t.string :name
      t.string :objective
      t.integer :num_months

      t.timestamps
    end
  end
end
