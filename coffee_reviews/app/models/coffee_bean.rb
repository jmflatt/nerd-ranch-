class CoffeeBean < ActiveRecord::Base
  belongs_to :roaster
  belongs_to :origin
  has_one :tasting_note

  before_create :initialize_tasting_note, unless: :tasting_note_present?

  validates :name, presence: true
  validates :roasted_on, presence: true,
                         if: roaster_present?

 private

  def initialize_tasting_note
    build_tasting_note
  end

  def tasting_note_present?
    tasting_note.present?
  end

  def roaster_present?
    roaster.present?
  end
end
