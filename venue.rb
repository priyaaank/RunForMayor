class Venue

  attr_accessor :id, :name, :lat, :long

  def initialize id, name, latitude, longitude
    @id   = id
    @name = name
    @lat  = latitude
    @long = longitude
  end

end
