class SpellCard
  def initialize(name, type)
    @name = name
    @type = type
  end

  def to_s
    "#{@name}[#{@type}]"
  end

  def attack(monster)
    if monster.status.to_s.eql? 'burnt'
      monster.add_turn(1, @type)
      print "casts #{@name} spell on enemy's #{monster.name}"
    end
  end
end