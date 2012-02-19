module Filters
  class VenueFilter 

    FILTERS = [Filters::LocationFilter.new, Filters::DailySpotFilter.new]

    def include? venue
      FILTERS.each do |filter|
        return false unless filter.include?(venue)
      end
      true
    end

  end
end
