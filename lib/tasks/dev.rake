namespace :dev do

  desc "Setup Development"
  task setup: :environment do
    puts "Executando o setup para desenvolvimento..."
    puts "APAGANDO BD... #{%x(rake db:drop)}"
    puts "CRIANDO BD... #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:generate_users)
    puts %x(rake dev:generate_ads)
    puts "Setup completado com sucesso!"
  end

  desc "Cria Users Fake"
  task generate_users: :environment do
    puts "Cadastrando User..."
    100.times do
      User.create!(
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456"
      )
    end
    puts "USERS cadastrados com sucesso!"
  end

  #################################################################

  desc "Cria Anúncios Fake"
  task generate_ads: :environment do
    puts "Cadastrando ANÚNCIOS..."
    5.times do
      Ad.create!(
        title: "kkkkk",
        description: "bbbbb",
        user: User.first,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
      )
    end
    100.times do
      Ad.create!(
        title: "kkkkk",
        description: "aaaa",
        user: User.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
      )
    end
    puts "ANÚNCIOS cadastrados com sucesso!"
  end

end