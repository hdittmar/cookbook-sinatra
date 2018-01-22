class Recipe
  attr_reader :name, :description, :time, :difficulty
  attr_accessor :done

  def initialize(name, description, time = "N/A", difficulty = "N/A", done = false)
    @name = name
    @description = description
    @time = time
    @difficulty = difficulty
    @done = done
  end

  def do
    @done = true
  end
end
