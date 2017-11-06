class CreateDailySessions < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_sessions do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
