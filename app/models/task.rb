class Task < ApplicationRecord

  # t.string "description"
  # t.integer "chore_id"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false

  belongs_to :chore
  validates :description, :presence => true
end
