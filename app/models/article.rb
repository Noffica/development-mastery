# model
class Article < ApplicationRecord
  extend FriendlyId

  validates :title, presence: true
  validates :body,  presence: true, uniqueness: { scope: :title }
  friendly_id :slug_candidates, use: [:slugged, :history]
  validates :slug,  presence: true

  def should_generate_new_friendly_id?
    title_changed? || slug.blank?
  end

  private
  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end
end #of file
