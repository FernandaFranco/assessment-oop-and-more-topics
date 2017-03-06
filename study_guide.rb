# # explain clearly:

# # classes and objects

# # - defining a class and instantiating it:

# class Robot
#   def initialize(name, description)
#     @name = name
#     @description = description
#   end
# end

# wall_e = Robot.new("Wall-e", "trash compactor") # Robot object

# # attr_* to create setter and getter methods and how to call them:

# class Robot
#   attr_reader :name
#   attr_accessor :description

#   def initialize(name, description)
#     @name = name
#     @description = description
#   end

#   def retire
#     puts "#{self.name} was a #{description}. "
#     self.description = "deactivated robot"
#     puts "#{name} now is a #{description}"
#   end

#   # def name
#   #   @name
#   # end

#   # def description
#   #   @description
#   # end

#   # def description=(new_description)
#   #   @description = new_description
#   # end
# end

# wall_e = Robot.new("Wall-e", "trash compactor") # Robot object
# p wall_e.name
# wall_e.description = "robot in love"
# p wall_e.description

# wall_e.retire

# # instance methods vs class methods

# class Robot
#   def initialize(name, description)
#     @name = name
#     @description = description
#   end

#   def move_forward # instance method
#     puts "I'm moving forward!"
#   end

#   def self.three_laws # class method
#     puts "A robot may not injure a human being or, through inaction, "\
#          "allow a human being to come to harm. A robot must obey the orders "\
#          "given it by human beings except where such orders would conflict "\
#          "with the First Law. "\
#          "A robot must protect its own existence as long as such protection "\
#          "does not conflict with the First or Second Laws."
#   end
# end

# bb_8 = Robot.new("BB-8", "cute little robot")
# bb_8.move_forward
# Robot.three_laws

# referencing and setting an instance variable vs using accessor methods

# - setter/getter methods are available outside the class definition, unless
# defined as private methods

# class inheritance and modules:

# a class can only sub-class from 1 super class at a time, but can mix in
# multiples modules.



module Oilable
  def oil
    puts "oiling the metal parts..."
  end
end

class Machine
  include Oilable
end

class Robot < Machine
  def initialize(name, description)
    @name = name
    @description = description
  end
  puts self

  def self.test
    new('bob', 'tin can')
  end
end

wall_e = Robot.new("Wall-e", "trash compactor") # Robot object
wall_e.oil
p Robot.ancestors
p Robot.test

# method lookup path

# if class dont have initialize method, the method lookup path goes to super class
# first class, then module, then superclass, then module, then superclass ...
# if I call a method on a Robot object, the lookup path is Robot, Machine, Oilable, Object, Kernel, BasicObject
# A way of seeing that is calling #ancestors on the class

# self

# call self.method = to let ruby know we're calling a method, not assigning a local variable

# a self inside a class but outside a instance method definition refers to the class itself.

# we can actually call any method with self, but for when in the right scope it's not necessary

# being able to read OO code: understand what is happening

# fake operators: special syntax allow us to write some methods more naturally
# not all operators are methods
# we can override/ create functionality for fake operators. GOOD
# but opens a world of possibilities as to what it can mean. BAD
# powerful but dangerous.
# overriding the == method also gives us the != method.
# the default implementation of ==, in BasicObject, is the same as equal?
# Range#=== is used for equality comparison in case statements

# truthiness
# expressions or method calls after a if/unless are gonna evaluate to true or false
# short circuit behavior of logical  operators