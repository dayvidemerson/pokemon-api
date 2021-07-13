# frozen_string_literal: true

module Api
  class PokemonsController < ApplicationController
    def show
      response = Pokemon.request(permitted_params[:pokemon])

      render json: response[:content], status: response[:status]
    end

    private

    def permitted_params
      params.permit(:pokemon)
    end
  end
end
