# frozen_string_literal: true

RSpec.describe '/api/v1/users', type: :request do
  def do_request
    get('/api/v1/users')
  end

  let!(:user) { User.create(email: 'j.doe@example.com') }

  before { do_request }

  it 'returns 200 and correct response' do
    expect(response.status).to eq 200

    body = json(response.body)
    expect(body.size).to eq 1
    expect(body[0]['email']).to eq User.first.email
  end
end
