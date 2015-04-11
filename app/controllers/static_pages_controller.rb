class StaticPagesController < ApplicationController
  layout 'static'

  def index
    if signed_in?
      redirect_to overview_path
    end
  end
end
