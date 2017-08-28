class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.references :user, foreign_key: true, index: true
      t.string :entity
      t.boolean :create, default: false
      t.boolean :read, default: false
      t.boolean :update, default: false
      t.boolean :destroy, default: false

      t.timestamps
    end
  end
end
