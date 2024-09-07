class CreatePrintOffers < ActiveRecord::Migration[7.2]
  def change
    create_table :print_offers do |t|
      t.references :print_request, null: false, foreign_key: true
      t.references :printer, null: false, foreign_key: { to_table: :users }
      t.decimal "price", precision: 10, scale: 2, null: false
      t.date "estimated_completion_date", null: false
      t.text "notes"
      t.string "status", default: "pending", null: false

      t.timestamps

      t.index ["status"], name: "index_print_offers_on_status"
    end
  end
end
