class CreatePrintRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :print_requests do |t|
      t.references :requester, null: false, foreign_key: { to_table: :users }
      t.string "description", null: false
      t.string "file_url", null: false
      t.string "material"
      t.string "color"
      t.decimal "max_price", precision: 10, scale: 2
      t.date "needed_by"
      t.string "status", default: "open", null: false
      t.timestamps
      t.index ["status"], name: "index_print_requests_on_status"
    end
  end
end
