class PortalController < ApplicationController
  def index
    @teams = Team.find(:all)
  end

end
