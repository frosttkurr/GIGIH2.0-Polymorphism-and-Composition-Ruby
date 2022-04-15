require_relative 'monster'
STATUS = 'burnt'
TURN = 3

class FireMonster < Monster
  def attack(monster)
    @damage = 0
    @self_damage = 0.5 * monster.attack_point
    @skill_damage = 0.4 * @attack_point
    
    if @freeze_turn == 1
      print "#{@name} is in frozen state, can't attack"
    else
      take_damage(0.5 * monster.attack_point)
      monster.set_burnt(STATUS, @skill_damage, TURN)
      
      print "#{@name} uses elemental attack on enemy's #{monster.name}, deals #{@damage} damage, takes #{@self_damage} damage, inflict burnt status for #{TURN} turns with #{@skill_damage} damage each turn"
    end
  end
end