module Filters
  module Inclusions
    class LocationRule
      
      def evaluate venues
        venues.select {|venue| !venue.city.nil? and venue.city.downcase == AccessConfig.new.city.downcase }
      end

    end
  end
end
