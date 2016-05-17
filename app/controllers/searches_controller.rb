class SearchesController < ApplicationController
  respond_to :html, :json
  def query_persona
   	respond_to do |format|
  	  format.html
      format.json {
        if(params.has_key?(:q))
          @personas = Persona.where("LOWER(razon) LIKE ?", "%#{params[:q].downcase}%").order(id: :desc)
          respond_with @personas
        else 
          render nothing: true
        end
      }
    end
  end
end
