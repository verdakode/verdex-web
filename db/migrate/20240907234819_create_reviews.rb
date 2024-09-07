class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.references :reviewer, null: false, foreign_key: { to_table: :users }
      t.references :reviewed, null: false, foreign_key: { to_table: :users }
      t.references :print_request, null: false, foreign_key: true
      t.integer "rating", null: false
      t.text "comment"
      t.timestamps
      t.index ["reviewer_id", "print_request_id"], name: "index_reviews_on_reviewer_and_print_request", unique: true
    end
  end
end
