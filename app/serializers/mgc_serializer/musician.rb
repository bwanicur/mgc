module MGCSerializer
  class Musician
    def initialize(musician)
      @musician = musician
    end

    def as_hash
      MGCSerializer::Person.new(@musician).as_hash
    end
  end
end
