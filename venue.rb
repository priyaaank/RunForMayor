class Venue

  attr_accessor :id, :name, :lat, :long, :city, :been_here_times

  def initialize hash, been_here
    @id               = hash["id"]
    @name             = hash["name"]
    @lat              = hash["location"]["lat"]
    @long             = hash["location"]["lng"]
    @city             = hash["location"]["city"]
    @been_here_times  = been_here
  end

end
