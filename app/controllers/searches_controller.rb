class SearchesController < ApplicationController
  respond_to :html, :json

  def query_persona
   	respond_to do |format|
  	  format.html
      format.json {
        if(params.has_key?(:q) && params[:q].length > 3)
        	@typesearch = params[:q]
          	if(@typesearch.first(2).downcase == 'd.')
          		@personas = Persona.where("LOWER(nro_doc) LIKE ?", "#{params[:q].from(2).downcase}%").order(id: :desc)	
          	else
          		@personas = Persona.where("LOWER(razon) LIKE ?", "%#{params[:q].downcase}%").order(id: :desc)
      	  	end
          respond_with @personas
        else 
          render nothing: true
        end
      }
    end
  end

  def query_imponible
    respond_to do |format|
      format.html
      format.json {
        if(params.has_key?(:q) && params[:q].length > 0)
          @typesearch = params[:q]
            @imponibles = Imponible.where("id = ?", params[:q]).order(id: :desc) 
          respond_with @imponibles
        else 
          render nothing: true
        end
      }
    end
  end
end
