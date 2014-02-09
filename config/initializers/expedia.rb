Expedia.setup do |config|
	config.cid = ENV['EXPEDIA_CID'] # your cid once you go live.
	config.api_key = ENV['EXPEDIA_API_KEY']
	config.shared_secret = ENV['EXPEDIA_SHARED_SECRET']
	config.locale = ENV['EXPEDIA_LOCALE'] # For Example 'de_DE'. Default is 'en_US'
	config.currency_code = ENV['EXPEDIA_CURRENCY_CODE'] # For Example 'EUR'. Default is 'USD'
	config.minor_rev = ENV['EXPEDIA_MINOR_REV'] # between 4-19 as of Dec 2012. Default is 4. 19 being latest
end
