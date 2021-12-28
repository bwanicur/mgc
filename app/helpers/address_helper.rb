# frozen_string_literal: true

module AddressHelper
  def full_address(address_obj)
    [
      address_obj.address,
      address_obj.city,
      address_obj.state,
      address_obj.zipcode
    ].compact.map(&:to_s).join(" ")
  end
end
