class PropertyFormsController < ApplicationController
  before_action :set_property_form, only: [:show, :update, :destroy, :address_validation, :description_1, :description_2, :description_3]

  # CRUD ACTIONS

  def show
  end

  def create
    @property_form = PropertyForm.create(property_form_params)
    redirect_to property_form_address_path(@property_form)
  end

  def update
    if @property_form.update(property_form_params)
      head :no_content, status: :ok
    else
      render  @property_form.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @property_form.destroy
      redirect_to root_path
    end
  end

  # FORM SPECIFIC ACTIONS

  def address_validation
    @marker = { lat: @property_form.latitude, lng: @property_form.longitude }
  end

  def description_1
  end

  def description_2
    if params[:property_type]
      unless @property_form.update(property_type: params[:property_type])
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def description_3
  end

  private

  def set_property_form
    if params[:property_form_id]
      @property_form = PropertyForm.find(params[:property_form_id])
    else
      @property_form = PropertyForm.find(params[:id])
    end
  end

  def property_form_params
    params.require(:property_form).permit(:address,
    :property_type,
    :livable_size_sqm,
    :num_rooms,
    :num_bedrooms,
    :num_bathrooms,
    :has_terrace,
    :has_cellar,
    :property_state,
    :kitchen_state,
    :bathroom_state,
    :appartment_size_sqm,
    :appartment_floor,
    :building_state,
    :has_works_in_building_planned,
    :building_construction_year,
    :has_elevator,
    :has_parking,
    :has_balcony,
    :property_total_size_sqm,
    :num_floors,
    :has_garage,
    :has_pool,
    :has_attic,
    :ground_floor_size_sqm,
    :size_cellar_sqm,
    :size_balcony_sqm,
    :size_terrace_sqm,
    :is_attic_convertible)
  end
end
