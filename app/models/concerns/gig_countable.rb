module GigCountable
  def increment_gig_count!
    update!(num_gigs: num_gigs + 1)
  end
end
