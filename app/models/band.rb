class Band < ApplicationRecord
    validates :name, presence: { message: "^Band must have a name" }
end
