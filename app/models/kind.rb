class Kind < ApplicationRecord
	has_many :contacts

    scope :to_the, ->(user) { where(user: user) }
end
