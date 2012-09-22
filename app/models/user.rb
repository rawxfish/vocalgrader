class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :provider, :uid
end
