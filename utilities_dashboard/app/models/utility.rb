class Utility < ActiveRecord::Base
  has_many :privileges, dependent: :destroy
  has_many :bills, dependent: :destroy

  validates :name, presence: true
end
