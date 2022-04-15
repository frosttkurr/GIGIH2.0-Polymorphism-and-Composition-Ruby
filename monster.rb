class Monster
  attr_reader :name, :attack_point, :status

  def initialize(name, hitpoint, attack_point)
    @name = name
    @hitpoint = hitpoint
    @attack_point = attack_point
    @turn = 0
  end

  def to_s
    if @hitpoint > 0
      if @turn == 0 
        "#{@name}[#{@hitpoint}]"
      else
        "#{@name}[#{@hitpoint}][#{@status}]"
      end
    else
      if @turn == 0 
        "#{@name}[X]"
      else
        "#{@name}[X][#{@status}]"
      end
    end
  end

  def attack(monster)
    if @freeze_turn == 1
      print "#{@name} is in frozen state, can't attack"
    else
      monster.take_damage(@attack_point)
      take_damage(0.5 * monster.attack_point)
    
      print "#{@name} attacks enemy's #{monster.name}, deals #{@attack_point.to_f} damage and takes #{0.5 * monster.attack_point} damage"
    end
  end

  def set_burnt(burnt_status, burnt_damage, burnt_turn)
    @status = burnt_status
    @burnt_damage = burnt_damage
    @burnt_turn = burnt_turn
    @turn = @burnt_turn
  end

  def set_freeze(freeze_status, freeze_damage, freeze_turn)
    self.take_damage(freeze_damage)
    @status = freeze_status
    @freeze_turn = freeze_turn
    @turn = @freeze_turn
  end

  def check_burnt
    if @burnt_turn >= 1 and @burnt_turn <= 3
      self.take_damage(@burnt_damage)
      @burnt_turn -= 1
      @turn = @burnt_turn
    else
      @status = nil
      @burnt_turn = 0
      @turn = 0
    end
  end

  def check_freeze
    if @freeze_turn == 1
      @freeze_turn -= 1
      @turn = @freeze_turn
    else
      @status = nil
      @freeze_turn = 0
      @turn = 0
    end
  end

  def apply_skills
    if self.status.to_s.eql? "burnt"
      self.check_burnt
    elsif self.status.to_s.eql? "frozen"
      self.check_freeze
    end
  end

  def take_damage(amount)
    @hitpoint -= amount
  end

  def add_turn(turn, type)
    if type == 'fire'
      @burnt_turn += turn
    else type == 'ice'
      @freeze_turn += turn
    end
  end
end