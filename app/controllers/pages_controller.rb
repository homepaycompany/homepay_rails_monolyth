class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]
  before_action :set_form, only: [:home, :landing_liquidity, :how_it_works]

  def home
  end

  def landing_liquidity
  end

  def how_it_works
  end

  def about_us
  end

  def validation
  end

  private

  def set_form
    @property_form = PropertyForm.new
  end
end
