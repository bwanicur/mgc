module MGCSerializer
  class Musician
    def initialize(musician)
      @musician = musician
    end

    def as_hash
      hash = MGCSerializer::Person.new(@musician).as_hash
      hash.merge(instrument: @musician.instrument.name)
    end

    def as_json
      as_hash.to_json
    end
  end
end
