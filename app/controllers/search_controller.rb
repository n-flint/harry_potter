class SearchController < ApplicationController

  def index
    render locals: {
      facade: HogwartsFacade.new(params['house'])
    }
  end


end