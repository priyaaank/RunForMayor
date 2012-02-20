module Filters
  class Facilitator

    INCLUSION_FILTERS = [ 
                          Filters::Inclusions::DailySpotRule.new,
                          Filters::Inclusions::LocationRule.new
                        ]

    EXCLUSION_FILTERS = [
                          Filters::Exclusions::SingleCheckinPerDayRule.new
                        ]

    def filtered_venues_from venues
      chosen_venues    = filter_for_inclusion_rules venues
      discarded_venues = filter_for_exclusion_rules venues
      chosen_venues - discarded_venues
    end

    private

    def filter_for_exclusion_rules venues
      EXCLUSION_FILTERS.collect do |rule|
        rule.evaluate venues
      end.flatten.uniq
    end

    def filter_for_inclusion_rules venues
      INCLUSION_FILTERS.collect do |rule|
        rule.evaluate venues
      end.flatten.uniq
    end

  end
end
