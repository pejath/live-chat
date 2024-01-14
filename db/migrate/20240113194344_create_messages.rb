class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.belongs_to :chat, null: false
      t.belongs_to :user, null: false
      t.string :body,  null:false

      t.timestamps
    end
  end
end
