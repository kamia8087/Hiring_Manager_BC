class Interview < ApplicationRecord
  belongs_to :application
  belongs_to :user
  has_many :feedbacks
end
