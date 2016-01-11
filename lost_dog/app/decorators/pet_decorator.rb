class PetDecorator < Draper::Decorator
  delegate_all

  def breed
    if object.breed.blank?
      "Unknown breed"
    else
      object.breed
    end
  end
end
