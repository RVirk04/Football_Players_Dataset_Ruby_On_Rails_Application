class CountriesController < ApplicationController
  def index
    # @q = Country.ransack(params[:q])
    @countries = Country.all.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def search
    @query = params[:query]
    @countries = Country.paginate(page: params[:page], per_page: 10).where("countries.name LIKE ?",["%#{@query}%"])
    render "index"
    if @query.empty?
      flash[:notice] = "No results found for #{params[:query]}"
    end
  end

end
