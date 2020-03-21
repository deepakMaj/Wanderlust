class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    

  def self.email_name(email_id)
    str = ''
    email_id.split('').each{ |c|
      if c == '@'
        break
      else
        str = str + c
      end
    }
    return str
  end

end
