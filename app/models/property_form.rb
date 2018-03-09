class PropertyForm < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :property_images
  has_one :real_estate_property
  validates :token, uniqueness: true

  def dsc_1_fields
    a = [
          { section: 1, name: 'livable_size_sqm', input_type: 'text', desc: 'Surface habitable', unit: 'm2' },
          { section: 3, name: 'num_rooms', input_type: 'text', desc: 'Pièces', unit: 'nombre' },
          { section: 3, name: 'num_bedrooms', input_type: 'text', desc: 'Chambres', unit: 'nombre' },
          { section: 3, name: 'num_bathrooms', input_type: 'text', desc: 'Salles de bain', unit: 'nombre' }
        ]
    if self.property_type == 'house'
      a += [
              { section: 1, name: 'property_total_size_sqm', input_type: 'text', desc: 'Surface de la propriété', unit: 'm2' },
              { section: 2, name: 'num_floors', input_type: 'text', desc: 'Nombre d\'étages', unit: 'nombre' },
              { section: 2, name: 'ground_floor_size_sqm', input_type: 'text', desc: 'Surface du rez-de-chaussée', unit: 'm2' }
            ]
    elsif self.property_type == 'appartment'
      a += [
              { section: 2, name: 'appartment_floor', input_type: 'text', desc: 'Etage', unit: 'nombre' }
            ]
    end
    sections = [{id: 1, type: 'input_section'}, {id: 2, type: 'input_section'}, {id: 3, type: 'input_section'}]
    return { sections: sections, fields: a}
  end

  def dsc_2_fields
    a = [
          { section: 1, name: 'has_terrace', input_type: 'selection_box', desc: 'Terrasse', connected_field: 'size_terrace_sqm' },
          { section: 1, name: 'has_cellar', input_type: 'selection_box', desc: 'Cave', connected_field: 'size_cellar_sqm' },
          { section: 2, name: 'size_terrace_sqm', input_type: 'text', desc: 'Surface de la terrasse', unit: 'm2' },
          { section: 2, name: 'size_cellar_sqm', input_type: 'text', desc: 'Surface de la cave', unit: 'm2' }
        ]
    if self.property_type == 'house'
      a += [
            { section: 1, name: 'has_garage', input_type: 'selection_box', desc: 'Garage' },
            { section: 1, name: 'has_pool', input_type: 'selection_box', desc: 'Piscine' },
            { section: 1, name: 'has_attic', input_type: 'selection_box', desc: 'Combles', connected_field: 'is_attic_convertible' },
            { section: 2, name: 'is_attic_convertible', input_type: 'boolean', desc: 'Les combles sont-elles aménageables ?' }
            ]
    elsif self.property_type == 'appartment'
      a += [
              { section: 1, name: 'has_elevator', input_type: 'selection_box', desc: 'Ascenseur' },
              { section: 1, name: 'has_parking', input_type: 'selection_box', desc: 'Parking' },
              { section: 1, name: 'has_balcony', input_type: 'selection_box', desc: 'Balcon', connected_field: 'size_balcony_sqm' },
              { section: 2, name: 'size_balcony_sqm', input_type: 'text', desc: 'Surface du balcon', unit: 'm2' }
            ]
    end
    sections = [{id: 1, type: 'selection_section'}, {id: 2, type: 'hidden_input_section'}]
    return { sections: sections, fields: a}
  end

  def dsc_3_fields
    a = [
          { section: 1, name: 'building_construction_year', input_type: 'text', desc: 'Année de construction', unit: 'année' },
          { section: 3, name: 'property_state', input_type: 'state_box', desc: 'Etat général du bien', values: ['Neuf', 'Bon', 'Moyen', 'Mauvais'] },
          { section: 4, name: 'kitchen_state', input_type: 'state_box', desc: 'Etat de la cuisine', values: ['Neuf', 'Bon', 'Moyen', 'Mauvais'] },
          { section: 5, name: 'bathroom_state', input_type: 'state_box', desc: 'Etat de la salle de bain', values: ['Neuf', 'Bon', 'Moyen', 'Mauvais'] }
        ]
    if self.property_type == 'appartment'
      a += [
            { section: 6, name: 'building_state', input_type: 'state_box', desc: 'Etat général de l\'immeuble', values: ['Neuf', 'Bon', 'Moyen', 'Mauvais'] },
            { section: 7, name: 'has_works_in_building_planned', input_type: 'boolean', desc: 'Des travaux sont-ils prévus dans l\'immeuble ?', values: ['Neuf', 'Bon', 'Moyen', 'Mauvais'] }
            ]
    end
    sections = [{id: 1, type: 'input_section'}, {id: 2, type: 'input_section'}, {id: 3, type: 'input_section'}, {id: 4, type: 'input_section'}, {id: 5, type: 'input_section'}, {id: 6, type: 'input_section'}, {id: 7, type: 'input_section'}]
    return { sections: sections, fields: a}
  end

  def personnal_information_fields
    a = [
          { section: 1, name: 'last_name', input_type: 'text', desc: 'Nom', unit: 'Dupont' },
          { section: 1, name: 'first_name', input_type: 'text', desc: 'Prénom', unit: 'Jean' },
          { section: 2, name: 'email', input_type: 'text', desc: 'Addresse email', unit: 'jean.dupont@mail.com' },
          { section: 2, name: 'phone_number', input_type: 'text', desc: 'Téléphone' },
          { section: 3, name: 'time_to_sell', input_type: 'state_box', desc: 'Vous souhaitez vendre dans :', values: ['Moins d\'un mois', '1 à 2 mois', '2 à 3 mois', 'Plus de 3 mois'] },
        ]
    sections = [{id: 1, type: 'input_section'}, {id: 2, type: 'input_section'}, {id: 3, type: 'input_section'}]
    return { sections: sections, fields: a}
  end

  def all_pages
    return [self.dsc_1_fields, self.dsc_2_fields, self.dsc_3_fields, self.personnal_information_fields]
  end
end

