class Comment < ActiveRecord::Base
  belongs_to :problem, dependent: :destroy
  belongs_to :user
#  validates :problem_id, presence: true
#  validates :user_id, presence: true
  validates :comment, presence: true
end
