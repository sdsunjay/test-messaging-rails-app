class User < ActiveRecord::Base

    
    
    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :trackable, :validatable
  acts_as_messageable
  #attr_accessible :email, :name
  # def mailboxer_email(object)
  #   return "define_email@on_your.model"
  # end

  #def mailboxer_email(object)
  #  if self.no_email
  #  else
  #      nil
  #  end
  #end

  #Returning any kind of identification you want for the model
  #def name
  #  return self.name 
  #end

  def mailboxer_name
      self.name
  end

  def mailboxer_email(object)
      self.email
  end
end
