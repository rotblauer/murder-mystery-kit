class IndexController < ApplicationController
  def home
  	@hosts = Host.all
  	@games = Game.all
  end
end
