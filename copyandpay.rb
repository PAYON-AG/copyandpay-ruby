#!/usr/bin/env ruby

require 'net/https'
require 'uri'
require 'json'
 
def prepareCheckout()
	uri = URI('https://test.oppwa.com/v1/checkouts')
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	req = Net::HTTP::Post.new(uri.path)
	req.set_form_data({
	  'authentication.userId' => '8a8294184b4f2868014b4f86f767015d',
	  'authentication.password' => 'F8T7N4PD',
	  'authentication.entityId' => '8a8294184b4f2868014b4f87bf160173',
	  'paymentType' => 'DB',
	  'amount' => '50.99',
	  'currency' => 'EUR'
	})
	return JSON.parse(http.request(req).body)
end

puts prepareCheckout()["id"]