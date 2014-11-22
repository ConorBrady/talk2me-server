class CreateConversationMessages < ActiveRecord::Migration
  def change
    create_table :conversation_messages do |t|
      t.string :text
      t.references :user, index: true
      t.references :decision, index: true

      t.timestamps
    end
  end
end
