class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table "users", force: :cascade do |t|
      t.string "email", null: false
      t.string "password_digest", null: false
      t.string "name", null: false
      t.string "location"
      t.boolean "is_printer", default: false, null: false
      t.timestamps
      t.index ["email"], name: "index_users_on_email", unique: true
    end
  end
end
