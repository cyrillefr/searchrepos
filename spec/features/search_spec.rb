# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Search', type: :feature, js: true do
  it 'displays index page' do
    visit repos_path
    expect(page).to have_button 'Search'
  end

  context 'when a list is displayed' do
    let(:ocktokit_client) { instance_double(Octokit::Client) }
    let(:data) do
      [
        {
          'description': 'the 10 second blog-engine for hackers',
          'owner': { 'url': 'https://api.github.com/users/cloudhead' }
        },
        {
          'description': 'A simple and stable cross-browser testing tool',
          'owner': { 'url': 'https://api.github.com/users/totorojs' }
        }
      ]
    end
    let(:raw) do
      agent = Sawyer::Agent.new('https://api.github.com')
      {
        'total_count': 2,
        'items': [
          Sawyer::Resource.new(agent, data[0]),
          Sawyer::Resource.new(agent, data[1])
        ]
      }
    end

    before do
      visit repos_path
      allow(Octokit::Client).to receive(:new).and_return(ocktokit_client)
      allow(ocktokit_client).to receive(:search_repos).and_return(raw)
    end

    it 'displays a 2 lines list' do
      Kaminari.paginate_array(
        raw[:items], total_count: raw[:total_count]
      ).page(1)
      click_button('Search')
    end
  end
end
