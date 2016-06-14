class IndexController < ApplicationController
  def home
  	@hosts = Host.all
  	@evenings = Evening.all
  	@games = Game.all
  end
end
