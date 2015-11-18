require 'coinprism'

class CrowdfundController < ApplicationController
  def index
    @goal = ENV['btc_crowdfund_goal']|| 0.0
  end
end
