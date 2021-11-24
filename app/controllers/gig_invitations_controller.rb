class GigInvitationsController < ApplicationController
  def edit
    @gmm = find_gmm(params[:id])
  end

  def update
    gmm = find_gmm(params[:id])
    gmm.update!(
      confirmation_status: params[:confirmation_status],
      confirmed_at: Time.zone.now
    )
    render json: hash_gmm(gmm)
  end

  private

  def find_gmm(token)
    GigMusicianMembership.find_by!(confirmation_token: token)
  end

  def hash_gmm(gmm)
    MGCSerializer::GigMusicianMembership.new(gmm).as_hash
  end
end
