class StaticContentsController < ApplicationController
  def error
    @errors = params[:errors]
  end
end
