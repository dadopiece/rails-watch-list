class Bookmark < ApplicationRecord

  belongs_to :movie
  belongs_to :list

  validates :comment, presence: true
  validates :comment, length: { minimum: 6 }
  # validates_uniqueness_of :movie.id, :list.id
  validates :movie_id, uniqueness: { scope: :list_id}
end
