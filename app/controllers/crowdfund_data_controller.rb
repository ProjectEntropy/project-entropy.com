class CrowdfundDataController < ApplicationController
  def show
    # Get live stats on crowdfund
    if params[:metric] == 'asset'
      render json: {
        total_backers: CoinprismApi.asset_owners.owners.length,
        backers: CoinprismApi.asset_owners.owners
      }
    elsif params[:metric] == 'btc'
      total_raised = CoinprismApi.balance
      goal = ENV['btc_crowdfund_goal']|| 0.0

      render json: {
        total_raised: total_raised.to_btc,
        percent: percent  = (total_raised.to_btc.to_f / goal.to_f).round
      }
    end
  end
end
