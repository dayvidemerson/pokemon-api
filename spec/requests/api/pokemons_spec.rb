# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Pokemons', type: :request do
  describe 'GET /show' do
    context 'when success' do
      let(:content_response) { %w[imposter limber] }

      before(:all) do
        VCR.use_cassette('poke_api/pokemons/get/success') do
          get '/api/pokemons/ditto'
        end
      end

      it 'returns success status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns array of abilities' do
        expect(response.parsed_body).to eq(content_response)
      end
    end

    context 'when not found' do
      before(:all) do
        VCR.use_cassette('poke_api/pokemons/get/not_found') do
          get '/api/pokemons/fulano'
        end
      end

      it 'returns success status code' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns array of abilities' do
        expect(response.parsed_body).to eq('error' => 'Not Found')
      end
    end
  end
end
