class Url < ApplicationRecord
  validates_presence_of :long_url, :short_url
  validates_uniqueness_of :short_url
  
end
