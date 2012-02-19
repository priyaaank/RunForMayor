class Checkin

  include Mongoid::Document

  field :venue_id,   :type => String
  field :venue_name, :type => String
  field :datetime,   :type => Time,  :default => Time.now

  embedded_in :day

  def self.for_venue venue
    Checkin.new(:venue_id => venue.id, :venue_name => venue.name)
  end

end
