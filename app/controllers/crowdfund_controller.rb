require 'coinprism'

class CrowdfundController < ApplicationController
  def index
    # Get live stats on crowdfund
    @total_raised = Coinprism.balance
    @backers      = Coinprism.asset_owners.owners.length
  end
end
