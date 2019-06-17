class Application < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :candidate, optional: true
  has_many :interviews
  validates :candidate_id, presence: true
  validates :user_id, presence: true
  validates :experience, presence: true, length: { maximum: 50 }
  validates :qualification, presence: true, length: { maximum: 50 }
  validates :contact_number, presence: true, length: { maximum: 10 }
  validates :exp_salary, presence: true
  validates :notice_period, presence: true, length: { maximum: 50 }
  validates :assigned_to, presence: true, length: { maximum: 50 }
  validates :status, presence: true, length: { maximum: 50 }
end
