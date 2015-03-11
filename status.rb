#!/usr/bin/env ruby

require 'net/https'
require 'uri'
require 'json'
 
def getPaymentStatus(checkoutId)
	uri = URI("https://test.oppwa.com/v1/checkouts/" + checkoutId + "/payment")
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	req = Net::HTTP::Get.new(uri.path)
	res = http.request(req)
	return JSON.parse(res.body)
end

status = getPaymentStatus("D17CCA478699234A362282C97C5C1589.sbg-vm-tx02")
if (status["result"]["code"].start_with?("000"))
	puts "SUCCESS <br/><br/> Here is the result of your transaction: <br/><br/>"
	puts status
else
	puts "ERROR <br/><br/> Here is the result of your transaction: <br/><br/>"
	puts status
end