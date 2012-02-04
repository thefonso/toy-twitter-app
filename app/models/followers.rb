class Followers < ActiveRecord::Base
    validates_uniqueness_of :follower_id
end
