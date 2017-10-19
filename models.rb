class User < ActiveRecord::Base
  has_many :sources

end

class Source < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :users
end

class Profile < ActiveRecord::Base
  belongs_to :users


end
