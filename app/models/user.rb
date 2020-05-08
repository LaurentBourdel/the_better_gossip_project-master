class User < ApplicationRecord
	has_secure_password
	belongs_to :city
	has_many :gossips
	has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
	has_many :private_message_recipients, foreign_key: 'recipient_id'
	has_many :received_messages, through: :private_message_recipients, source: :private_message
	validates :email, presence: true
	validates :password_digest, presence: true
end
