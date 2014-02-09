require 'api_cache'
require 'dalli'

APICache.store = APICache::DalliStore.new(Dalli::Client.new)
