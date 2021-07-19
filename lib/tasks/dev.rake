namespace :dev do
  desc "Configuração do ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Excluindo banco de dados...") { %x(rails db:drop) }
      show_spinner("Criando banco de dados...") { %x(rails db:create) }
      show_spinner("Criando as tabelas...") { %x(rails db:migrate) }
      %x(rails dev:add_mining_type)
      %x(rails dev:add_coins)
    else
      puts 'Você não está em ambiente de desenvolvimento.'
    end
  end

  desc "Cadastrando Moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando Moedas...") do
      coins = [
          { description: "Bitcoin",
            acronym: "BTC",
            url_image: "https://logospng.org/download/bitcoin/logo-bitcoin-512.png",
            mining_type: MiningType.find_by(acronym: "PoW")
          },
          { description: "Ethereum",
            acronym: "ETH",
            url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/628px-Ethereum_logo_2014.svg.png",
            mining_type: MiningType.all.sample
          },
          { description: "Dash",
            acronym: "DASH",
            url_image: "https://ih1.redbubble.net/image.565893629.7574/st,small,845x845-pad,1000x1000,f8f8f8.u2.jpg",
            mining_type: MiningType.all.sample
          }
      ]
      coins.each do |coin|
          Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastrando tipos de mineração"
  task add_mining_type: :environment do
    show_spinner("Cadastrando Tipos de Mineração...") do
      mining_types = [
        { description: "Proof of Work", acronym: "PoW" },
        { description: "Proof of Stake", acronym: "PoS" },
        { description: "Proof of Capacity", acronym: "PoC" }
      ]
      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private
  def show_spinner(msg_start, msg_end = "Concluido com sucesso!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
