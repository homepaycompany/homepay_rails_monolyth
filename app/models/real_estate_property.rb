class RealEstateProperty < ApplicationRecord
  validates :address,
  :property_type,
  :num_floor,
  :num_room,
  :num_bedroom,
  :num_bathroom,
  :size_carrez_sqm,
  :size_total_sqm,
  :building_construction_year,
  :has_balcony,
  :has_garage,
  :has_terrace,
  :has_cellar,
  :has_parking,
  :has_elevator,
  :has_garden,
  :has_works_in_building_planned,
  :needs_renovation,
  :building_state,
  :property_state,
  :kitchen_state,
  :bathroom_state, presence: true
  validates :size_cellar_sqm, presence: true, if: :has_cellar?
  validates :size_balcony_sqm, presence: true, if: :has_balcony?
  validates :size_garden_sqm, presence: true, if: :has_garden?


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

  def has_garden?
    self.has_garden
  end

  def has_works_in_building_planned?
    self.has_works_in_building_planned
  end

end
