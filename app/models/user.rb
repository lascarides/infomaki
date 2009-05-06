class User < ActiveRecord::Base

  validates_presence_of :first_name, :last_name, :password, :email
  validates_format_of :password, :with => /.{6}.*/

end
