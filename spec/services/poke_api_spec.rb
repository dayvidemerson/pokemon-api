# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PokeApi do
  let(:poke_api) { described_class.new }

  describe '#get(api_path)' do
    context 'when success' do
      let(:abilities_response) do
        [
          {
            'ability' => {
              'name' => 'limber',
              'url' => 'https://pokeapi.co/api/v2/ability/7/'
            },
            'is_hidden' => false,
            'slot' => 1
          },
          {
            'ability' => {
              'name' => 'imposter',
              'url' => 'https://pokeapi.co/api/v2/ability/150/'
            },
            'is_hidden' => true,
            'slot' => 3
          }
        ]
      end

      let!(:response) do
        VCR.use_cassette('poke_api/pokemons/get/success') do
          poke_api.get('/pokemon/ditto')
        end
      end

      it 'returns http response' do
        expect(response).to be_kind_of(HTTParty::Response)
      end

      it 'returns success status code' do
        expect(response.code).to eq(200)
      end

      it 'returns array of abilities' do
        expect(response.parsed_response['abilities']).to eq(abilities_response)
      end
    end

    context 'when not found' do
      let!(:response) do
        VCR.use_cassette('poke_api/pokemons/get/not_found') do
          poke_api.get('/pokemon/fulano')
        end
      end

      it 'returns http response' do
        expect(response).to be_kind_of(HTTParty::Response)
      end

      it 'returns success status code' do
        expect(response.code).to eq(404)
      end

      it 'returns array of abilities' do
        expect(response.parsed_response).to eq('Not Found')
      end
    end
  end
end
