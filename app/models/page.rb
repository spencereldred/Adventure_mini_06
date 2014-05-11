class Page < ActiveRecord::Base
  belongs_to :adventure, dependent: :destroy
end
