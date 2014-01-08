class Generator
  include ActiveModel::Validations
  include ActiveModel::Conversion

  CARD_TYPES = %w{masterminds schemes henchmen villains heroes}

  attr_accessor :number_of_players, :number_of_games, :games,
                :available_masterminds, :available_schemes, :available_henchmen, :available_villains, :available_heroes,
                :used_masterminds, :used_schemes, :used_henchmen, :used_villains, :used_heroes


  def initialize(number_of_players, number_of_games)
    self.number_of_players = number_of_players
    self.number_of_games = number_of_games
    self.games = []
    CARD_TYPES.each do |card_type|
      reset_available_and_used_cards(card_type)
    end
  end

  def generate
    number_of_games.times do
      game = generate_game(number_of_players, random_mastermind, random_schema)
      set_used_cards(game)
      set_available_cards(game)
      games << game
    end
    games
  end

  def persisted?
    false
  end

  def set_used_cards(game)
    ["masterminds", "schemes", "heroes", "henchmen"].each do |card_type|
      used_cards = self.send("available_#{card_type}").select { |cards| game[card_type.to_sym].include?(cards[:name]) }
      self.send("used_#{card_type}=", (send("used_#{card_type}") + used_cards).uniq)
    end
  end

  def set_available_cards(game)
    ["masterminds", "schemes", "heroes", "henchmen"].each do |card_type|
      self.send("available_#{card_type}=", send("available_#{card_type}").select { |cards| !game[card_type.to_sym].include?(cards[:name]) }.uniq)
      reset_available_and_used_cards(card_type) if send("available_#{card_type}").blank?
    end
  end

  def reset_available_and_used_cards(card_type)
    self.send("available_#{card_type}=", "Constants::#{card_type.upcase}".constantize)
    self.send("used_#{card_type}=", [])
  end

  private

  def generate_game(number_of_players, mastermind, scheme)
    {
        masterminds: [mastermind[:name]],
        schemes: [scheme[:name]],
        henchmen: random_henchmen(number_of_players, mastermind, scheme),
        villains: random_villains(number_of_players, mastermind, scheme),
        heroes: random_heroes(number_of_players, scheme),
    }
  end

  def players_config(number_of_players)
    Constants::PLAYERS[number_of_players-1]
  end

  def randomizer(array)
    array.shuffle.first
  end

  def random_mastermind
    randomizer(available_masterminds)
  end

  def random_schema
    randomizer(available_schemes)
  end

  def result_formatter(array)
    array.map { |object| object[:name] }
  end

  def random_henchmen(number_of_players, mastermind, scheme)
    result = result_formatter(available_henchmen.shuffle)

    result = result.unshift(mastermind[:henchmen]).uniq if mastermind[:henchmen].present?

    henchmen_count = players_config(number_of_players)[:henchmen] + (scheme[:henchmen].present? ? scheme[:henchmen] : 0)

    if henchmen_count > result.size
      reset_available_and_used_cards('henchmen')
      result = (result + result_formatter(available_henchmen.shuffle)).uniq
    end

    result[0..henchmen_count-1]
  end

  def random_villains(number_of_players, mastermind, scheme)
    result = result_formatter(available_villains.shuffle)


    result = result.unshift(mastermind[:villains]).uniq if mastermind[:villains].present?
    result = result.unshift(scheme[:villains]).uniq if scheme[:villains].present?

    villains_count = players_config(number_of_players)[:villains]

    if villains_count > available_villains.size
      reset_available_and_used_cards('villains')
      result = (result + result_formatter(available_villains.shuffle)).uniq
    end

    result[0..villains_count-1]
  end

  def random_heroes(number_of_players, scheme)
    result = result_formatter(available_heroes.shuffle)

    heroes_count = scheme[:heroes].present? ? scheme[:heroes] : players_config(number_of_players)[:heroes]

    if heroes_count > available_heroes.size
      reset_available_and_used_cards('heroes')
      result = (result + result_formatter(available_heroes.shuffle)).uniq
    end
    result[0..heroes_count-1]
  end


end
