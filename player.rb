class Player
  attr_reader :monsters, :player_name

  def initialize(player_name)
    @player_name = player_name
    @monsters = []
  end

  def to_s
    puts "#{@player_name}:"
    @monsters.join(", ")
  end

  def add_monster(monster)
    @monsters.append(monster.dup)
  end

  def add_spellcard(spellcard)
    @monsters.append(spellcard.dup)
  end

  def attack(target, card, opponent)    
    if @monsters.include? card and target.monsters.include? opponent
      print "#{@player_name}'s "
      card.attack(opponent)
    elsif @spellcards.include? card
      puts ""
      print "#{@player_name}'s "
      card.attack(opponent)
    end
    puts ""
    puts ""
  end

  def special_skills
    @monsters.each do |monster|
      unless monster.class.name.eql? "SpellCard"
        monster.apply_skills
      end
    end
  end

  def stats
    puts self
    puts ""
  end
end