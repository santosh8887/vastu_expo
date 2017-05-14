class PropertiesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    Rails.logger.info "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#{params.inspect}"
    @properties = params.has_key?(:area) ? Property.by_area(params[:area]) : Property.all
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @property_attachments = @property.property_attachments.all
    @related_properties = Property.by_category(@property.category).where.not(id: @property.id)
  end

  # GET /properties/new
  def new
    @property = Property.new
    @property_attachment = @property.property_attachments.build
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
   @property = Property.new(property_params)

   respond_to do |format|
     if @property.save
       params[:property_attachments]['avatar'].each do |a|
          @property_attachment = @property.property_attachments.create!(:avatar => a)
       end
       params[:property_attachments]['small_avatar'].each do |sa|
          @property_attachment = @property.property_attachments.create!(:small_avatar => sa)
       end
       format.html { redirect_to @property, notice: 'Property was successfully created.' }
     else
       format.html { render action: 'new' }
     end
   end
 end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:name, :description, :larg_description, :amount, 
        :size, :bedroom, :bathroom, :garage, :status, :uses, :category,
        :address_line_1, :address_line_2, :area, :city, :pin, :state, :country, :is_futured,
        property_attachments_attributes: [:id, :property_id, :avatar, :small_avatar])
    end
end

