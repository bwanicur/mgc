class GigsController < ApplicationController
  def index
    # TODO: gigs by region should be the default
    #       else filtered by users.url_name
  end

  def show
    @gig = Gig.find(params[:id])
  end
end
