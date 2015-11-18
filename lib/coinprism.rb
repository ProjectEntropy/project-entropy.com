# Ruby interface to Coinprism's API
require 'rest-client'
require 'ostruct'

class Coinprism
  COINPRIM = "https://api.coinprism.com/v1/"
  ADDRESS_URL = "addresses/"
  ASSET_URL = "assets/"


  def self.address_info(address)
    cached_get("#{COINPRIM}#{ADDRESS_URL}/#{address}")
  end

  def self.balance(address = nil)
    address = ENV['btc_crowdfund_address'] unless address
    balance = address_info(address).balance
    Satoshi.new(balance, from_unit: :satoshi)
  end

  def self.asset_owners(asset_id = nil)
    asset_id = ENV['asset_id'] unless asset_id
    response = cached_get("#{COINPRIM}#{ASSET_URL}/#{asset_id}/owners")
    
  end

  def self.cached_get(url)
    Rails.cache.fetch(url, expires_in: 5.minutes) do
      response = RestClient.get(url)
      OpenStruct.new JSON.parse(response.body)
    end
  end

end
