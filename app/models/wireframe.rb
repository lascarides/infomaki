class Wireframe < ActiveRecord::Base

  has_many :initiatives
  has_many :pageviews

  has_attached_file :screenshot, :styles => { :thumb=> "100x100#" }

end
