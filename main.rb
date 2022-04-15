require_relative 'ice_monster'
require_relative 'fire_monster'
require_relative 'player'
require_relative 'spell_card'

phpkachu = Monster.new('Phpkachu', 120, 50)
sqlrtle = IceMonster.new('Sqlrtle', 180, 20)
cppmander = FireMonster.new('Cppmander', 100, 80)
bashtoise = IceMonster.new('Bashtoise', 120, 60)
torterraform = Monster.new('Torterraform', 200, 10)

flamethrower = SpellCard.new('Flamethrower', 'fire')

player1 = Player.new('Player 1')
player1.add_monster(sqlrtle)
player1.add_monster(cppmander)
player1.add_spellcard(flamethrower)

player2 = Player.new('Player 2')
player2.add_monster(phpkachu)
player2.add_monster(cppmander)
player2.add_monster(bashtoise)

puts "=======================Turn 1======================="
puts ""
player1.stats
player2.stats

player1.attack(player2, player1.monsters[1], player2.monsters[2])
player1.stats
player2.stats

player2.attack(player1, player2.monsters[1], player1.monsters[0])
player1.stats
player2.stats

puts "=======================Turn 2======================="
player1.special_skills
player2.special_skills
puts ""
player1.stats
player2.stats

player1.attack(player2, player1.monsters[2], player2.monsters[2])
player1.stats
player2.stats

puts "=======================Turn 3======================="
player1.special_skills
player2.special_skills
puts ""
player1.stats
player2.stats

puts "=======================Turn 4======================="
player1.special_skills
player2.special_skills
puts ""
player1.stats
player2.stats

puts "=======================Turn 5======================="
player1.special_skills
player2.special_skills
puts ""
player1.stats
player2.stats