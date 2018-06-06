class PoliticiansController < ApplicationController
  def index
    if params[:chamber]
      @politicians = Politician.filter_by_chamber(params[:chamber])
    else
      @politicians = Politician.all
    end
  end

  def show
    member = Politician.find(params[:id])
    @politician = PoliticianPresenter.new(member)
    @profile = ProfilePresenter.new(member, member.profile)
  end
end
