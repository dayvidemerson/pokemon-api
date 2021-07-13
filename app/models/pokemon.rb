# frozen_string_literal: true

class Pokemon
  attr_accessor :abilities

  class << self
    def request(slug)
      response = poke_api.get("/pokemon/#{slug}")

      if response.code == 200
        { status: 200, content: response.parsed_response['abilities'].map do |ability|
                                  ability['ability']['name']
                                end.sort }
      else
        { status: response.code, content: { error: response.parsed_response } }
      end
    end

    private

    def poke_api
      @poke_api ||= PokeApi.new
    end
  end
end
