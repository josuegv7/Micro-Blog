class User < ActiveRecord::Base
  has_many :sources

end

class Source < ActiveRecord::Base
  belongs_to :user
end
