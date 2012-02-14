class LocationFilter
  def include? venue
    (!venue.city.nil? && venue.city.downcase == AccessConfig.new.city.downcase)
  end
end
