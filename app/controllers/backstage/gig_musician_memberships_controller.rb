module Backstage
  class GigMusicianMembershipsController < BaseController

    def create
      gmm = GigMusicianMembership.create({
        gig_id: params[:gig_id],
        musician_id: params[:musician_id]
      })
      if gmm.valid?
        render json: { success: true, gig_musician_membership: hash_gmm(gmm) }
      else
        render json: { success: false, errors: gmm.errors }
      end
    end

    def update
      gmm = GigMusicianMembership.find(params[:id])
      if gmm.update_attributes({
        confirmation_status: params[:confirmation_status],
        confirmed_at: Time.zone.now
      })
        render json: { success: true, gig_musician_membership: hash_gmm(gmm) }
      else
        render json: { success: false, errors: gmm.errors }
      end
    end

    def destroy
      gmm = GigMusicianMembership.find(params[:id])
      render json: { success: (gmm.destroy ? true : false) }
    end

    private

    def hash_gmm(gmm)
      JsonPresenter::GigMusicianMembership.new(gmm).as_hash
    end

  end
end
