class CreateGruppettos < ActiveRecord::Migration[7.0]
  def change
    create_table :gruppettos do |t|
      t.references :track, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamp :start
      t.string :name
      t.text :description
      t.float :avg_speed
      t.integer :status
      t.integer :difficulty
      t.integer :event_type
      t.integer :participation_rule

      t.timestamps
    end
  end
end
