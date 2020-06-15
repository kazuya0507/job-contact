class CreateOkays < ActiveRecord::Migration[5.2]
  def change
    create_table :okays do |t|
      t.references :message, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
