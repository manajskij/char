class ChangeBriefing < ActiveRecord::Base
  belongs_to :briefing
  belongs_to :user
#  validates :briefing_id, presence: true
  validates :user_id, presence: true
#  validates :brief, presence: true
end
