# Ruby interface to Coinprism's API
require 'rest-client'
require 'ostruct'

class Coinprism
  COINPRIM = "https://api.coinprism.com/v1/"
  ADDRESS_URL = "addresses/"


  def self.address_info(address)
    response = RestClient.get("#{COINPRIM}#{ADDRESS_URL}/#{address}")

    OpenStruct.new JSON.parse(response.body)
  end

  def self.balance(address = nil)
    address = ENV['btc_crowdfund_address'] unless address
    balance = address_info(address).balance
    Satoshi.new(balance, from_unit: :satoshi)
  end

  def self.asset_balance(address, asset_id)
    address = ENV['btc_crowdfund_address'] unless address


    address_info(address).assets
  end

end
