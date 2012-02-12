class VenueFilter 

  FILTERS = [LocationFilter.new]

  def exclude? venue
    FILTERS.each do |filter|
      return true if filter.exclude?(venue)
    end
    false
  end

end
