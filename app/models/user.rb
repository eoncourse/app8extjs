class User < ActiveRecord::Base
  attr_accessible :email, :name, :phone
  def name_email
    return name+email
  end

end
