class PoliticiansController < ApplicationController
  def index
    @politicians = Politician.all
  end

  def show
    @politician = PoliticianPresenter.new(params[:id])
  end
end
