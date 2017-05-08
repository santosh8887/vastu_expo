class HomeController < ApplicationController
  def index
  	@featured_properties = Property.get_properties(Property::CATEGORIES.second)
  	@recent_properties = Property.get_properties(Property::CATEGORIES.third)
  end
end
