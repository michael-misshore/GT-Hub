class CarsController < ApplicationController
  
  def _get_years
    years = Car.get_years_by_make(params[:make]).order('year DESC').all.map {|car| car.year}

    respond_to do |format|
      format.json  { render :json => years, :content_type => "text/html" }
    end
  end
  
  def _get_models
    models = Car.where('make = ?', params[:make])
    models = models.where('year = ?', params[:year]) unless params[:year].empty?
    models = models.order('year DESC, model DESC').all.map {|car| {:id => car.id, :name => "#{car.year} #{car.model}"}}

    respond_to do |format|
      format.json  { render :json => models, :content_type => "text/html" }
    end
  end
  
end