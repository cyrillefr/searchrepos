# frozen_string_literal: true

class ReposController < ApplicationController
  before_action :set_client
  def index; end

  def search
    # IMPORTANT: search_repos does not retrieve
    # private repos by default
    raw = @client.search_repos(params[:q], { page: params[:page] })
    total_count = raw[:total_count]
    @repos = Kaminari.paginate_array(
      raw[:items], total_count: total_count
    ).page(params[:page])
    respond_to :js
  end

  private

  def set_client
    @client = Octokit::Client.new(per_page: 10)
  end
end
