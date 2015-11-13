require 'coinprism'

class CrowdfundController < ApplicationController
  def index
    # Get live stats on crowdfund
    @total_raised = Coinprism.balance
  end
end
