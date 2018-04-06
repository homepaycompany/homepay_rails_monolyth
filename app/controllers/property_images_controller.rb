class PropertyImagesController < ApplicationController
  before_action :set_property_form, only: [:create]
  skip_before_action :verify_authenticity_token, only: [:destroy] # Required for ajax request to delete picture image in property form

  def create
    image = PropertyImage.new()
    image.photo = params[:file]
    image.property_form = @property_form
    if image.save
      respond_to do |format|
        format.json do
          json = {id: image.id}
          render json: json
        end
      end
    end
  end

  def destroy
    @image = PropertyImage.find(params[:id])
    @property_form = PropertyForm.find_by(token: params[:property_form_id])
    if @image.destroy
      respond_to do |format|
        format.html { redirect_to form_step_6_path(@property_form.token) }
        format.js
      end
    else
    end
  end

  private

  def set_property_form
    @property_form = PropertyForm.find(params[:property_form_id])
  end
end
