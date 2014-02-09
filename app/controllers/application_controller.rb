class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # use the api with a default parameter if empty
  def get_hotels_list_response(search_parameters = { :destinationString => 'new york' })
    options = {
      :cache => 5.days,    # 10 minutes  After this time fetch new data
      :valid => 10.days,  # 1 day       Maximum time to use old data
      #:forever is a valid option
      :period => 0,    # 1 minute    Maximum frequency to call API
      #:timeout => 5     # 5 seconds   API response timeout
    }
    destination = search_parameters[:destinationString]
    APICache.get(destination.downcase, options) do
      # Instentiate api object
      api = Expedia::Api.new

      # Method to search for a hotel. see http://developer.ean.com/docs/read/hotels/version_3/request_hotel_list
      # {:propertyName => 'Hotel Moa Berlin', :destinationString => 'berlin'}
      api.get_list(search_parameters)
    end
  end

  # return an array of hotel hashes
  def get_hotels(search_parameters_hash, how_many_results = 10)
    response =  get_hotels_list_response(search_parameters_hash)
    puts response
    # execute this method to know if there is any exception
     if response.exception? # false if success
       flash[:alert] = "#{response.presentation_message}"
       redirect_to new_search_path
     else
      response.body["HotelListResponse"]["HotelList"]["HotelSummary"].take(how_many_results) 
     end
  end
end