class CountriesController < ApplicationController
  def index
    # @q = Country.ransack(params[:q])
    @countries = Country.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    # if params[:location].present?
    #   @country = Country.near(params[:name])
    # else
    #   @country = Country.find(params[:id])
    # end
    # @country = @country.to_gmaps4rails
    @country = Country.find(params[:id])
  end

  def search
    @query = params[:query]
    @countries = Country.paginate(page: params[:page], per_page: 10).where("countries.name LIKE ?",["%#{@query}%"])
    render "index"
    # if @query.empty?
    #   flash[:notice] = "No results found for #{params[:query]}"
    # end
  end

end
