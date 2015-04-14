class OverviewController < ApplicationController
  def index
    @timeline = Timeline.new(current_user)
  end
end
