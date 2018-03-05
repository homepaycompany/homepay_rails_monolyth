class PropertyFormsController < ApplicationController
  def show
    @property_form = PropertyForm.find(params[:id])
    @marker = { lat: @property_form.latitude, lng: @property_form.longitude }
  end
  def create
    @property_form = PropertyForm.create(property_form_params)
    redirect_to property_form_path(@property_form)
  end

  private

  def property_form_params
    params.require(:property_form).permit(:address)
  end
end
