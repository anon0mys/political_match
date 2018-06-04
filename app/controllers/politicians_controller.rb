class PoliticiansController < ApplicationController
  def index
    if params[:chamber]
      @politicians = Politician.filter_by_chamber(params[:chamber])
    else
      @politicians = Politician.all
    end
  end

  def show
    @politician = PoliticianPresenter.new(params[:id])
  end
end
