class Chore < ApplicationRecord

  # t.string "name"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false

  has_many :tasks
  validates :name, :presence => true
end
