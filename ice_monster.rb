require_relative 'monster'
STATUS = 'frozen'
TURN = 1

class IceMonster < Monster
  def attack(monster)
    @damage = 0.8 * @attack_point
    @self_damage = 0.5 * monster.attack_point
    @skill_damage = 0
    
    if @freeze_turn == 1
      print "#{@name} is in frozen state, can't attack"
    else
      take_damage(0.5 * monster.attack_point)
      monster.set_freeze(STATUS, @skill_damage, TURN)
      
      print "#{@name} uses elemental attack on enemy's #{monster.name}, deals #{@damage} damage, takes #{@self_damage} damage, inflict frozen status for #{TURN} turns with #{@skill_damage} damage each turn"
    end
  end
end