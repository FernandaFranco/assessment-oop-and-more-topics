# class Banner
#   def initialize(message)
#     @message = message
#     @size = @message.size
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def horizontal_rule
#     "+-#{'-'*@size}-+"
#   end

#   def empty_line
#     "| #{' '*@size} |"
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner
# banner = Banner.new('')
# puts banner

class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def state
    switch
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end
sewing_machine = Machine.new

p sewing_machine.start
p sewing_machine.stop

p sewing_machine.state