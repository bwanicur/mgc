module Backstage
  class GigsController < BaseController
    include PersonParams

    def index
      gigs = GigService::Search.new(current_user, gig_search_params).run
      render json: { gigs: gigs.map{|g| hg(g)} }
    end

    def show

      gig = Gig.find(params[:id])
      render json: { gig: hg(gig) }
    end

    def create
      atts = gig_params.merge(user_id: current_user.id)
      musicians = atts.delete(:musicians)
      gig = GigService::Create.new(gig: atts, musicians: musicians).run
      if gig.valid?
        render json: { success: true, gig: hg(gig) }
      else
        all_errors = { gig: gig.errors, musicians: gig.musicians.map{|m| m.errors } }
        render json: { success: false, errors: all_errors }
      end
    end

    def update
      gig = Gig.find(params[:id])
      if gig.update_attributes(gig_params)
        render json: { success: true, gig: hg(gig) }
      else
        render json: { success: false, errors: gig.errors }
      end
    end

    def destroy
      gig = Gig.find(params[:id])
      render json: { success: gig.destroy ? true : false }
    end

    private

    def hg(gig)
      JsonPresenter::Gig.new(gig).as_hash
    end

    def gig_search_params
      params.permit(:venue_id, :title, :start_time, :direction, :limit)
    end

    def gig_params
      params.require(:gig).permit(
        :venue_id,
        :title,
        :start_time,
        :end_time,
        :short_description,
        :description,
        :musician_info,
        :is_template,
        musicians: [
          :id,
          *PERSON_PARAMS,
          :instrument_id
        ]
      )
    end

  end
end
