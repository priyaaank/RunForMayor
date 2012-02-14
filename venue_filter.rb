class VenueFilter 

  FILTERS = [LocationFilter.new, DailySpotFilter.new]

  def include? venue
    FILTERS.each do |filter|
      return false unless filter.include?(venue)
    end
    true
  end

end
