# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  describe '.request(slug)' do
    context 'when success' do
      let(:content_response) { %w[imposter limber] }

      let!(:response) do
        VCR.use_cassette('poke_api/pokemons/get/success') do
          described_class.request('ditto')
        end
      end

      it 'returns success status code' do
        expect(response[:status]).to eq(200)
      end

      it 'returns array of abilities' do
        expect(response[:content]).to eq(content_response)
      end
    end

    context 'when not found' do
      let!(:response) do
        VCR.use_cassette('poke_api/pokemons/get/not_found') do
          described_class.request('fulano')
        end
      end

      it 'returns success status code' do
        expect(response[:status]).to eq(404)
      end

      it 'returns array of abilities' do
        expect(response[:content]).to eq(error: 'Not Found')
      end
    end
  end
end
