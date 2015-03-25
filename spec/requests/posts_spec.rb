require 'rails_helper'

RSpec.describe 'urls linking to external sites', :type => :request do

  describe 'post' do
    it 'can redirect an individual post' do
      external_url = "http://google.com"
      get external_url
      expect(response.status).to eq 200
    end
  end
end
