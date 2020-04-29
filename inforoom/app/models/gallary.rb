class Gallary < ApplicationRecord

	self.per_page = 2
	
	extend FriendlyId
	friendly_id :name, use: :slugged


	has_many_attached :collection

	def thumbnail input
		return self.collection[input].variant(resize: '300x300!').processed
	end


end
  