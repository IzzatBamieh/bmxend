class CreatePoliceReports < ActiveRecord::Migration[5.0]
  def change
    create_table :police_reports do |t|
      t.decimal :lat
      t.decimal :lng
      t.datetime :time_locked
      t.datetime :time_discovered_stolen
      t.string :status

      t.timestamps
    end
  end
end
