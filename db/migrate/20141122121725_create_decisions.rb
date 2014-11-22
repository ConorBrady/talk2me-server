class CreateDecisions < ActiveRecord::Migration
  def change
    create_table :decisions do |t|
      t.references :problem, index: true
      t.references :user, index: true
      t.integer :outcome

      t.timestamps
    end
  end
end
