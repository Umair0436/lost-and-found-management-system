class Item < ApplicationRecord
    belongs_to :user
    encrypts :location

end
