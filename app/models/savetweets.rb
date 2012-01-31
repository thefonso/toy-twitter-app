class Savetweets < ActiveRecord::Base
  validates_uniqueness_of :post_id
  @savedtweets = Savetweets.all
end
