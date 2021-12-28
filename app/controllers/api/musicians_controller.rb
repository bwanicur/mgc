# frozen_string_literal: true

module API
  class MusiciansController < BaseController
    PER_PAGE = 10

    def index
      # TODO: replace with search service (order by musician gig memberships count)
      musicians = current_user.musicians
      musicians = musicians.page(page_param).per(PER_PAGE) if has_paginate_params?
      render json: { musicians: musicians.map { |m| hm(m) } }
    end

    def show
      render json: hm(Musician.find(params[:id]))
    end

    def create
      musician = Musician.create!(
        musician_params.merge(user: current_user)
      )
      render json: hm(musician)
    end

    def update
      musician = Musician.find(params[:id])
      musician.update!(musician_params)
      render json: hm(musician)
    end

    def destroy
      musician = Musician.find(params[:id])
      musician.destroy!
      head :ok
    end

    private

    def hm(musician)
      MGCSerializer::Musician.new(musician).as_hash
    end

    def musician_params
      params.require(:musician).permit(
        :email,
        :full_name,
        :phone,
        :instrument
      )
    end
  end
end
