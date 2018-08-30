module Backstage
  class MusiciansController < ApplicationController
    include PersonParams

    PER_PAGE = 10

    def index
      # todo: replace with search service (order by musician gig memberships count)
      musicians = current_user.musicians
      if has_paginate_params?
        musicians = musicians.page(page_param).per(PER_PAGE)
      end
      render json: { musicians: musicians.map{|m| hm(m)} }
    end

    def show
      musician = Musician.find(params[:id])
      render json: { musician: hm(musician) }
    end

    def create
      musician = Musician.new(musician_params)
      musician.user = current_user
      if musician.save
        render json: { success: true, musician: hm(musician) }
      else
        render json: { success: false, errors: musician.errors }
      end
    end

    def update
      musician = Musician.find(params[:id])
      if musician.update_attributes(musician_params)
        render json: { success: true, musician: hm(musician) }
      else
        render json: { success: false, errors: musician.errors }
      end
    end

    def destroy
      musician = Musician.find(params[:id])
      success = musician.destroy ? true : false
      render json: { success: success }
    end

    private

    def hm(musician)
      MGCSerializer::Musician.new(musician).as_hash
    end

    def musician_params
      params.require(:musician).permit(:id, *PERSON_PARAMS, :instrument_id)
    end
  end
end
