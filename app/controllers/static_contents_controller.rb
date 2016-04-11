class StaticContentsController < ApplicationController
  def errors
    @errors = params[:errors]
  end
end
