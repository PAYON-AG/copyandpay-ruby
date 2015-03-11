#!/usr/bin/env ruby

require 'net/https'
require 'uri'
require 'json'
 
def getPaymentStatus(checkoutId)
	uri = URI.parse("https://test.oppwa.com/v1/checkouts/" + checkoutId + "/payment")
	puts "GET request to: " + uri.path
	res = Net::HTTP.get_response(uri)
	puts res.body
	return JSON.parse(res.body)
end

status = getPaymentStatus("657C5266C2EFE56D32B20F5CD07F1221.sbg-vm-tx02")
if (status["result"]["code"].start_with?("000"))
	puts "SUCCESS <br/><br/> Here is the result of your transaction: <br/><br/>"
	puts status
else
	puts "ERROR <br/><br/> Here is the result of your transaction: <br/><br/>"
	puts status
end