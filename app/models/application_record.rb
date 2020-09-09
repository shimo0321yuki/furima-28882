class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  belongs_to :item
end
