class HotelsController < ApplicationController

  def index
    @destination = params[:destination] || params[:search][:destinationString] || "New York".parameterize

    # list hotels based on paramerers from search#new else redirect to search page
    search_parameters_hash = { destinationString: @destination }
    if search_parameters_hash.is_a?(Hash)
     @hotels_list =  Rails.cache.fetch @destination, :expires_in => 5.minutes do
        get_hotels(search_parameters_hash)
      end
    else
      redirect_to new_search_path
    end
  end

end
