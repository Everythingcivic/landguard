class District
  include Mongoid::Document
  include Mongoid::Timestamps #add this for date activity
  
  
   
   field :name, type: String
   field :code, type: String
   field :is_active, type: Boolean, default: true
   field :is_deleted, type: Boolean, default: false 
   
   belongs_to :parent_district, class_name: "District", foreign_key: "parent_id" #for self reference, now this line creates foreign_key for same table and it will stored as a obj in database
   has_many :landmasters
   
end
