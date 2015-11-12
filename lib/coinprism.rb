# Ruby interface to Coinprism's API
require 'rest-client'
class Coinprism
  COINPRIM = "https://api.coinprism.com/v1/"
  ADDRESS_URL = "addresses/"


  def self.address_info(address)
    response = RestClient.get "#{COINPRIM}#{ADDRESS_URL}/#{address}"
  end

  

  
end
