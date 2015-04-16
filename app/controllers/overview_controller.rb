class OverviewController < ApplicationController
  before_action :require_login

  def index
    @timeline = Timeline.new(current_user)
  end
end
