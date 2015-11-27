# Ruby interface to Coinprisms API
# Rate limited + cached to not overwhelm things
require 'rest-client'
require 'ostruct'

class CoinprismApi
  def self.address_info(address)
    cached_get("address_info") do
      Coinprism.address_info(address)
    end
  end

  def self.balance(address = nil)
    address = ENV['btc_crowdfund_address'] unless address

    cached_get("address_info_balance") do
      balance = address_info(address).balance
    end
    Satoshi.new(balance, from_unit: :satoshi)
  end

  def self.asset_owners(asset_id = nil)
    asset_id = ENV['asset_id'] unless asset_id

    cached_get("asset_owners") do
      Coinprism.asset_owners(asset_id)
    end
  end

  def self.cached_get(key)
    Rails.cache.fetch(key, expires_in: 5.minutes) do
      yield
    end
  end

end
