class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :title
      t.string :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
