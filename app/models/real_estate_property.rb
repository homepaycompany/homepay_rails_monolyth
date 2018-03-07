class RealEstateProperty < ApplicationRecord
  belongs_to :property_form
  has_many :property_images, through: :property_form
  validates :address,
  :property_type,
  :livable_size_sqm,
  :num_rooms,
  :num_bedrooms,
  :num_bathrooms,
  :property_state,
  :kitchen_state,
  :building_construction_year,
  :bathroom_state, presence: true
  validates :appartment_floor,
  :building_state,
  :has_works_in_building_planned, presence: true, if: :is_appartment?
  validates :property_total_size_sqm,
  :num_floors,
  :ground_floor_size_sqm, presence: true, if: :is_house?
  validates :size_cellar_sqm, presence: true, numericality: { greater_than: 0 }, if: :has_cellar?
  validates :size_balcony_sqm, presence: true, numericality: { greater_than: 0 }, if: :has_balcony?
  validates :size_terrace_sqm, presence: true, numericality: { greater_than: 0 }, if: :has_terrace?

  def is_appartment?
    self.property_type == 'appartment'
  end

  def is_house?
    self.property_type == 'house'
  end

  def has_attic?
    self.has_attic
  end

  def has_balcony?
    self.has_balcony
  end

  def has_garage?
    self.has_garage
  end

  def has_terrace?
    self.has_terrace
  end

  def has_cellar?
    self.has_cellar
  end

  def has_parking?
    self.has_parking
  end

  def has_elevator?
    self.has_elevator
  end

  def has_works_in_building_planned?
    self.has_works_in_building_planned
  end

end
