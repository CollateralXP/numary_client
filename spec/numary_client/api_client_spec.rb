# frozen_string_literal: true

RSpec.describe NumaryClient::ApiClient do
  describe '#get' do
    subject { described_class.current_client.get('/_info') }

    before do
      stub_request(:get, 'http://localhost:3068/_info')
        .to_return(status: 200, body: '{"data":{"server":"numary-ledger","version":"1.8.1"}}')
    end

    it 'returns server info' do
      expect(subject['data']['server']).to eq('numary-ledger')
    end
  end

  describe '#post' do
    subject { described_class.current_client.post('/collateralxp/script', { plain: plain }) }

    let(:plain) do
      <<~PLAIN
        send [COIN 100] (
          source = @centralbank
          destination = @spec
        )
      PLAIN
    end

    before do
      stub_request(:post, 'http://localhost:3068/collateralxp/script')
        .with(body: { plain: plain }, headers: { 'Content-Type' => 'application/json' })
        .to_return(status: 200, body: '{"data":{"result":2}}')
    end

    it 'posts successfuly' do
      expect(subject['data']['result']).to eq(2)
    end
  end
end
