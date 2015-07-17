class Comment < ActiveRecord::Base
  belongs_to :problem
  belongs_to :user
  validates :user_id, presence: true
  validates :problem_id, presence: true
  validates :comment, presence: true
end
