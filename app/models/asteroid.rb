class Asteroid < ApplicationRecord
  default_scope { order('created_at DESC')}
  validates_presence_of :title, :description, presence: true
  validates :title, length: {maximum: 50}, uniqueness: true
  validates :description, length: {maximum: 2000}
end
