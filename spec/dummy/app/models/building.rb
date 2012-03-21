class Building < ActiveRecord::Base
  validates :name, :presence => true
  validates :county, :florida_counties => true
end
