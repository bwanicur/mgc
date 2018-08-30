class GigsController < ApplicationController
  def index
  end
  
  def show
    @gig = Gig.find(params[:id])
  end
  
  # musician info for gig
  def info
    @gig = Gig.find_by_priv_hash(params[:id])
  end
end
