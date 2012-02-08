class User < ActiveRecord::Base
attr_accessible :name, :email

valiates :name, :presence => true
valiates :email, :presence => true

end
