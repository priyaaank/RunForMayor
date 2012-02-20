module Filters
  module Inclusions
    class DailySpotRule
      
      VENUE_IDS = [ 
        '4b39fad5f964a520fb5f25e3', '4c98591e2778224b2e8ea368',
        '4f169756a17c8a1445731fe2', '4eeed6a346907303c0989ca9',
        '4d0d8ab3bdbfa35df06d6a72', '4e738c891f6eaf402bcb8b21'
      ]

      def evaluate venues
        venues.select {|venue| VENUE_IDS.include?(venue.id)}
      end

    end
  end
end
