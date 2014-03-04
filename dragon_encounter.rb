# Implement the attack() function as defined by the following algorithm:

# 1. pick a random number from zero to the character's strength rating, 
# this is the actual attack value. HINT: investigate the rand() method
# 2. subtract the actual attack value from the opposing character's defense 
# value (the opposing character is given by the passed-in "character" variable), 
# this is the actual damage taken
# 3. subtract the actual damage taken from the opposing character's hitpoints
# 4. Print out the details of each step.

# Finally, build a loop to simulate a battle between the hero and monster... 
# follow this algorithm:

# 1. Check if either the hero or monster's hitpoints reach zero, if so, exit the program
# 2. Have the hero attack the monster and then vice versa
# 3. Repeat until #1 becomes true
  
def run_sample_battle
  # (name, hitpoints, attack_strength, defense_strength, experience, exp_reward)
  monster = Character.new  "Dragon", 100, 30, 10, 0, 20
  hero = Character.new "Paladin", 200, 55, 30, 0, 35
  battle = Battle.new hero, monster
  battle.execute
end

class Battle

  def initialize(character_one, character_two)
    @character_one = character_one
    @character_two = character_two
  end

  def execute
    battle_over = false

    # main loop
    while !battle_over do
      if @character_one.hitpoints <= 0
        battle_over = true
        @character_two.experience += @character_one.exp_reward
        print "The #{@character_two.name} wins!\n#{@character_two.name} gains #{@character_one.exp_reward} experience!\n"
      elsif @character_two.hitpoints <= 0
        battle_over = true
        print "The #{@character_one.name} wins!\n#{@character_one.name} gains #{@character_two.exp_reward} experience!\n"
      end
      @character_one.attack(@character_two)
      @character_two.attack(@character_one)
    end
  end

end

class Character
  attr_accessor :name
  attr_accessor :hitpoints
  attr_accessor :strength
  attr_accessor :defense
  attr_accessor :experience
  attr_accessor :exp_reward

  def initialize(name, hitpoints, attack_strength, defense_strength, experience, exp_reward)
    @name = name
    @hitpoints = hitpoints
    @strength = attack_strength
    @defense = defense_strength
    @experience = experience
    @exp_reward = exp_reward
  end

  def print_message(message, delay=1)
    puts message
    sleep(delay)
  end

  def attack(opponent)
    unless (opponent.hitpoints <= 0) || (hitpoints <= 0)
      attack_value = rand(strength)
      damage_taken = attack_value - opponent.defense
      print_message "#{name} attacks #{opponent.name} for #{attack_value}..."
      if damage_taken <= 0
        print_message "#{opponent.name} takes no damage!", 0
      else
        if opponent.hitpoints >= damage_taken
          opponent.hitpoints -= damage_taken
        else
          opponent.hitpoints == 0
        end
        print_message "#{opponent.name} takes #{damage_taken} damage!"
        print_message "#{opponent.name}'s HP is now #{opponent.hitpoints}"
      end
    end
  end

end

run_sample_battle
