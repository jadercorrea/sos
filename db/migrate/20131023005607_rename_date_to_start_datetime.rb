class RenameDateToStartDatetime < ActiveRecord::Migration
  def change
    rename_column :events, :date, :start_datetime
  end
end
