class Day

  include Mongoid::Document

  field :name, :type => String, :default => Time.now.strftime("%d-%m-%Y")

  embeds_many :checkins
  validates_uniqueness_of :name

  def self.today
    self.find_or_create_by({:name =>  Time.now.strftime("%d-%m-%Y")})
  end
  
  def add_checkin checkin
    self.checkins << checkin
    self.save!
  end
end
