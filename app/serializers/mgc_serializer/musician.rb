module MGCSerializer
  class Musician
    def initialize(musician)
      @musician = musician
    end

    def as_hash
      @musician.slice(
        :id,
        :email,
        :full_name,
        :phone,
        :num_gigs
      )
    end
  end
end
