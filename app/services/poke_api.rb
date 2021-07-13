# frozen_string_literal: true

class PokeApi
  include HTTParty

  base_uri 'https://pokeapi.co/api/v2/'

  headers 'Content-Type' => 'application/json'
  headers 'Accept' => 'application/json'

  def get(api_path)
    self.class.get(api_path)
  end
end
