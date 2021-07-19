# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin
spinner = TTY::Spinner.new("[:spinner] Cadastrando Moedas...")
spinner.auto_spin

coins = [
    {   description: "Bitcoin",
        acronym: "BTC",
        url_image: "https://logospng.org/download/bitcoin/logo-bitcoin-512.png"
    },
    {   description: "Ethereum",
        acronym: "ETH",
        url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/628px-Ethereum_logo_2014.svg.png"
    },
    {   description: "Dash",
        acronym: "DASH",
        url_image: "https://brandslogos.com/wp-content/uploads/images/large/dash-logo.png"
    }
]

coins.each do |coin|
    Coin.find_or_create_by!(coin)
end

spinner.success("(Concluído!)")
=end