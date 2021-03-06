
require 'faker'

# Sets the locale to "France":
Faker::Config.locale = 'fr'

# Détruire la base actuelle
GossipTagLink.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessageRecipient.destroy_all
PrivateMessage.destroy_all
User.destroy_all
City.destroy_all

# Remettre les compteurs à 0
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

# Création de 10 villes et de 10 utilisateurs associés
10.times do
	City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
	User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: true), email: Faker::Internet.free_email, age: rand(20..50), city: City.all.sample, password_digest: Faker::Lorem.characters(number: 10))
end
# Création de 10 gossips
20.times do
	Gossip.create(title: Faker::Lorem.sentence(word_count: 1, supplemental: false), content: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: true), user_id: User.ids.sample)
end
# Création de 10 tags
10.times do
	Tag.create(title: "##{Faker::Lorem.word}")
end
# Ajout des tags aux gossips (minimum un tag par gossip)
Gossip.all.each do |g|
	n = rand(1..3)
	n.times do
		GossipTagLink.create(gossip: g, tag: Tag.all.sample)
	end
end
# Création de fakes PM
10.times do
	PrivateMessage.create(content: Faker::Hipster.paragraph_by_chars, sender: User.all.sample)
end
# Ajout des destinataires aux privates messages (minimum un destinataire par message)
PrivateMessage.all.each do |pm|
	n = rand(1..3)
	n.times do
		PrivateMessageRecipient.create(private_message: pm, recipient: User.all.sample)
	end
end
