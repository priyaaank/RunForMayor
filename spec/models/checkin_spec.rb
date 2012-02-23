require 'spec_helper'

describe Checkin do

  it { should respond_to :venue_id   }
  it { should respond_to :venue_name }
  it { should respond_to :datetime   }
  it { should respond_to :day        }

  let (:venue_attributes) { { "id"              => "123456", 
                              "name"            => "atlantis",
                              "location"        => {"lat" => "12.345", "lng" => "11.23" },
                              "city"            => "somewhere far"
                            } 
                          }

  let(:current_time) { Time.now }

  it "should return a checkin for a given venue" do
    Time.should_receive(:now).and_return(current_time)
    venue     = Venue.new(venue_attributes, 23)
    checkin   = Checkin.for_venue(venue)

    checkin.venue_id.should   eq "123456"
    checkin.venue_name.should eq "atlantis"
    # checkin.datetime.should   eq current_time
  end

end
