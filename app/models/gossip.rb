class Gossip < ApplicationRecord
	belongs_to :user
	has_many :gossip_tag_links
	has_many :tags, through: :gossip_tag_links
	validates :title, presence: true, length: { minimum: 3, maximum: 14, message: "title need 3 car. or less than 14 car"} 
  validates :content,presence: true
end
