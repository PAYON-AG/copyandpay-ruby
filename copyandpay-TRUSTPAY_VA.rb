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
	  'authentication.userId' => '8a8294174b7ecb28014b9699220015cc',
	  'authentication.password' => 'sy6KJsT8',
	  'authentication.entityId' => '8a8294174b7ecb28014b9699a3cf15d1',
	  'paymentType' => 'DB',
	  'amount' => '10.00',
	  'currency' => 'EUR',
	  'customer.surname' => 'Jones',
	  'customer.givenName' => 'Jane',
	  'testMode' => 'EXTERNAL'
	})
	return JSON.parse(http.request(req).body)
end

puts prepareCheckout()["id"]