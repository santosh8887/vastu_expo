class Property < ActiveRecord::Base
	has_many :property_attachments
  accepts_nested_attributes_for :property_attachments

  scope :get_properties, -> (category){ where(category: category) }
  scope :by_area, -> (area){ where(area: area) }
  
  CATEGORIES = ["New Property", "Featured Property", "Recent Property"]
  USES = ["For Rent", "For Sale"]

  def address
  	addr = ""
  	addr << "#{ address_line_1 }, " unless address_line_1.blank?
  	addr << "#{ address_line_2 }, " unless address_line_2.blank?
  	addr << "#{ area }, "           unless area.blank?
  	addr << "#{ city }, "           unless city.blank?
  	addr << "#{ pin }, "            unless pin.blank?
  	addr << "#{ state }, "          unless state.blank?
  	addr << "#{ country }, "        unless country.blank?
  end

  def self.area_wise_property_list
  	Property.select('id, area').where.not(area: ["", nil]).first(5)
  end
  

end
