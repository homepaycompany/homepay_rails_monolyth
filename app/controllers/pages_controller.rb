class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
    @property_form = PropertyForm.new
  end
end
