module Filters
  module Exclusions
    class SingleCheckinPerDayRule

      def evaluate venues
        todays_checked_in_venue_ids = Day.today.checkins.map(&:venue_id).uniq
        venues.select {|venue| todays_checked_in_venue_ids.include?(venue.id) }
      end

    end
  end
end
