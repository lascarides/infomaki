class Organization < ActiveRecord::Base

  has_many :initiatives
  has_and_belongs_to_many :testees
  has_many :admins

end
