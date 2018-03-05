class PropertyForm < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :property_images
  has_one :real_estate_property
end
