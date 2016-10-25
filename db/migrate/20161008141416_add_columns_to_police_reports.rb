class AddColumnsToPoliceReports < ActiveRecord::Migration[5.0]
  def change
    add_reference :police_reports, :user, foreign_key: true
    add_reference :police_reports, :bike, foreign_key: true
  end
end
