class VenueList

  DEFAULT_LIMIT  = 250
  DEFAULT_OFFSET = 0

  attr_accessor :count, :venues, :user
  
  def initialize user
    @count     = 0
    @user      = user
    @filters   = VenueFilter.new
  end

  def all
    @venues ||= (populate || [])
  end

  private

  def populate
    (1..(@count / DEFAULT_LIMIT) + 1).each {|index| populate_venues_with_params(DEFAULT_LIMIT, current_offset(index))}
    @venues
  end

  def populate_venues_with_params limit = 250, offset = 0
    initialize_venues_from(Foursquare.venue_history @user, {"limit" => limit, "offset" => offset})
  end

  def initialize_venues_from hash
    @count = hash["count"] if @count != hash["count"]
    hash["items"].each do |item|
      @venues = [] if venues.nil?
      venue_details = Venue.new(item["venue"], item["beenHere"])
      (@venues << venue_details) unless @filters.exclude?(venue_details)
    end
  end

  def current_offset index
    (DEFAULT_LIMIT * (index-1))
  end
end
