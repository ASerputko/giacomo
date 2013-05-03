class SearchesController < ApplicationController
  def index
  	@persones = Persone.search(params[:query])
  end
end
