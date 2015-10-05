class LandmastersController < ApplicationController
  before_action :set_landmaster, only: [:show, :edit, :update, :destroy]
  before_action :get_districts, only: [:edit,:new,:create,:update]
	
  def get_taluka
		all_talukas = District.where(:parent_id => params[:id]).only(:name,:_id)#here we have use the param id directly which is passed in the url
  	respond_to do |format|
    format.json { render :json =>  all_talukas }
    end
  end
   
  # GET /landmasters
  # GET /landmasters.json
  def index
    @landmasters = Landmaster.all
  end

  # GET /landmasters/1
  # GET /landmasters/1.json
  def show
  end

  # GET /landmasters/new
  def new
    @landmaster = Landmaster.new
  end

  # GET /landmasters/1/edit
  def edit
	  @talukas = District.where(:parent_id => @landmaster.district_id)
		@talukas.each do |taluka|  
		Rails.logger.info ">>>#{taluka.inspect}"
		end
  end
 
  # POST /landmasters
  # POST /landmasters.json
  def create
    @landmaster = Landmaster.new(landmaster_params)
   
    respond_to do |format|
      if @landmaster.save
        format.html { redirect_to landmasters_path, notice: 'Landmaster was successfully created.' }
        format.json { render :show, status: :created, location: @landmaster }
      else
        format.html { render :new }
        format.json { render json: @landmaster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /landmasters/1
  # PATCH/PUT /landmasters/1.json
  def update
    respond_to do |format|
      if @landmaster.update(landmaster_params)
        format.html { redirect_to @landmaster, notice: 'Landmaster was successfully updated.' }
        format.json { render :show, status: :ok, location: @landmaster }
      else
        format.html { render :edit }
        format.json { render json: @landmaster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landmasters/1
  # DELETE /landmasters/1.json
  def destroy
    @landmaster.destroy
    respond_to do |format|
      format.html { redirect_to landmasters_url, notice: 'Landmaster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common set-up or constraints between actions.
    def set_landmaster
      @landmaster = Landmaster.find(params[:id])
    end

	def get_districts
	  @districts = District.where(:parent_id.in => [nil, ""]).only(:name,:id) #this method is created for code reuse ability and here we have used OR condition for nil and blank value
	  #@talukas = District.where(:parent_id.nin => [nil,""]) for getting talukas values from table district
	end
	
    # Never trust parameters from the scary internet, only allow the white list through.
    def landmaster_params
      params.require(:landmaster).permit(:land_type,:district_id,:district_name,:taluka_id, :taluka_name,:village,:survey_number, :survey_area, :FP_number, :TP_number, :FP_area, :FP_shape, :details, :remark, :is_land_allocated, :is_active, :is_deleted)
    end
end
