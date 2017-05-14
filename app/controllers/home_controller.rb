class HomeController < ApplicationController
  def index
  	@featured_properties = Property.get_featured_properties
  	@recent_properties = Property.get_recent_properties
  end
end
