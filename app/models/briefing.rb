class Briefing < ActiveRecord::Base
  belongs_to :user
  has_many :change_briefings
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :brief, presence: true
end
