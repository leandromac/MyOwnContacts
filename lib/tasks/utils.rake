namespace :utils do
 	desc "Popular banco de dados."
	task seed: :environment do

		puts "Gerando os tipos (Kinds)..."
			Kind.create!(
				description: "Amigo",
			)
			Kind.create!(
				description: "Família",
			)
			Kind.create!(
				description: "Trabalho",
			)
			Kind.create!(
				description: "Faculdade",
			)
		puts "Tipos gerados com sucesso (Kinds) [OK!]"

		puts "Gerando os contatos (Contacts)..."
			100.times do |i|
				Contact.create!(
					name: Faker::Name.name,
					email: Faker::Internet.email,
					kind: Kind.all.sample,
					rmk: LeroleroGenerator.sentence([1,2,3,4,5].sample)
				)
			end
		puts "Gerando os contatos (Contacts) [OK!]"

		puts "Gerando os endereços (Address)..."
			Contact.all.each do |_contact|
				Address.create!(
					street: Faker::Address.street_address,
					city: Faker::Address.city,
					state: Faker::Address.state_abbr,
					contact: _contact,
				)
			end
		puts "Gerando os endereços (Address) [OK!]"

		puts "Gerando os telefones (Phones)..."
			Contact.all.each do |_contact|
				Random.rand(1..5).times do |i|
					Phone.create!(
						phone: Faker::PhoneNumber.phone_number,
						contact: _contact,
					)
				end
			end
		puts "Gerando os telefones (Phones) [OK!]"

	end
end
