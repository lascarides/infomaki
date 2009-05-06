class Initiative < ActiveRecord::Base

  belongs_to    :organization
  belongs_to    :wireframe
  has_many      :replies, :dependent => :destroy

end
