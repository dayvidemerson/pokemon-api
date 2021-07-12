class Api::PokemonsController < ApplicationController
  before_action :set_poke_api

  def show
    response = Pokemon.request(permitted_params[:pokemon])

    render json: response[:content], status: response[:status]
  end

  private

  def permitted_params
    params.permit(:pokemon)
  end

  def set_poke_api
    @poke_api ||= PokeApi.new
  end
end
