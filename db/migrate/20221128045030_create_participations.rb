class CreateParticipations < ActiveRecord::Migration[7.0]
  def change
    create_table :participations do |t|
      t.references :gruppetto, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :participation_status

      t.timestamps
    end
  end
end
