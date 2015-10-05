class Landmaster
  include Mongoid::Document
  include Mongoid::Timestamps #add this for date activity
  
  Land_Type = ["Lake Land", "Shamshan Land","Meadows Land"] #to add dropdown values manually
  #fields added in the landmaster table
  
  field :land_type, type: String
  field :district_id, type: String
  field :district_name, type: String
  field :taluka_id, type: String
  field :taluka_name, type: String
  field :village, type: String
  field :survey_number, type: String
	field :survey_area, type: String
  field :FP_number, type: String
  field :TP_number, type: String
  field :FP_area, type: String
  field :FP_shape, type: String
  field :details, type: String
  field :remark, type: String
  field :is_land_allocated, type: Boolean
  field :is_active, type: Boolean, default: true
  field :is_deleted, type: Boolean, default: false 
   
  #Validation for fields in the landmaster table  
 
  validates_presence_of :land_type, message: "Can't be blank"
  validates_presence_of :district_id,  message: "Please Select District"
  #validates :district_name, presence: true
  validates_presence_of :taluka_id, message: "Please Select Taluka"
  #validates :taluka_name, presence: true
  validates :village, presence: true
  validates :survey_number, presence: true ,:uniqueness => {:message => " has already been taken."} 
  validates :survey_area, presence: true
  validates :FP_number, presence: true
  validates :TP_number, presence: true
  validates :FP_area, presence: true
  validates :FP_shape, presence: true
  # validates :details, presence: true
  # validates :remark, presence: true
	     
end
