class Bill < ActiveRecord::Base
  belongs_to :utility
  has_one :user, through: :utility

  validates :utility_id, :amount, :due_on, presence: true
end
