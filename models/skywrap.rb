class Skywrap

  def initialize user, venues
    @venues = venues
    @user   = user
  end

  def teleport_and_checkin
    @venues.each do |venue|
      Foursquare.checkin_user_at @user, venue
    end
  end

end
