class PropertyFormsController < ApplicationController
  def show
    @property_form = PropertyForm.find(params[:id])
  end
  def create
    @property_form = PropertyForm.create
    redirect_to property_form_path(@property_form)
  end
end
