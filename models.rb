class User < ActiveRecord::Base
  has_many :sources

end

class Source < ActiveRecord::Base
  belongs_to :user
  has_many :comments
end


class Comment < ActiveRecord::Base
  belongs_to :source

end
