module TestGeocoder
  MOCK_ATTS = {
    'latitude'     => 0.32715746e2,
    'longitude'    => -0.117138211,
    'address'      => '1 Broadway San Diego, CA, USA',
    'state'        => 'California',
    'state_code'   => 'CA',
    'country'      => 'United States',
    'country_code' => 'US'
  }

	def self.stub_geocode!
    Geocoder::Lookup::Test.reset
	  Geocoder::Lookup::Test.set_default_stub(
	    [	MOCK_ATTS ]
    )
  	Geocoder.configure(:lookup => :test)
	end

  def self.mock_atts
    MOCK_ATTS
  end

end
