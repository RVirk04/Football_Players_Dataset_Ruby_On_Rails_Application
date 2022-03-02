class CountriesController < ApplicationController
  def index
    @countries = Country.all.paginate(page: params[:page], per_page: 10)
  end

  def show
  end
end
