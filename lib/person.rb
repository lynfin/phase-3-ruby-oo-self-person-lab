require 'pry'
class Person
  attr_accessor :bank_account, :happiness, :hygiene
  attr_reader :name

  def initialize(name)
    @name = name
    @bank_account = 25
    @happiness = 8
    @hygiene = 8
  end

  def happiness=(value)
    @happiness = bounded_value(value)
  end

  def hygiene=(value)
    @hygiene = bounded_value(value)
  end

  def clean?
    @hygiene > 7
  end

  def happy?
    @happiness > 7
  end

  def get_paid(amount)
    @bank_account += amount
    'all about the benjamins'
  end

  def update_hygiene(val)
    self.hygiene = (@hygiene + val)
  end

  def update_happiness(val)
    self.happiness = (@happiness + val)
  end

  def take_bath
    update_hygiene(4)
    '♪ Rub-a-dub just relaxing in the tub ♫'
  end

  def work_out
    update_happiness(2)
    update_hygiene(-3)
    '♪ another one bites the dust ♫'
  end

  def call_friend(friend)
    update_happiness(3)
    friend.update_happiness(3)
    "Hi #{friend.name}! It's #{name}. How are you?"
  end

  def start_conversation(friend, topic)
    case topic
    when 'politics'

      update_happiness(-2)
      friend.update_happiness(-2)
      'blah blah partisan blah lobbyist'
    when 'weather'

      update_happiness(1)
      friend.update_happiness(1)
      'blah blah sun blah rain'
    else
      'blah blah blah blah blah'
    end
  end

  private

  def bounded_value(value)
    if value.between?(0, 10)
      value
    elsif value < 0
      0
    else
      10
    end
  end
end
