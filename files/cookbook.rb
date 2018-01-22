require "csv"

class Cookbook
  def initialize(file_path)
    @recipes = []
    @file_path = file_path
    CSV.foreach(@file_path) do |row|
      @recipes << row
    end
  end

  def all
    @recipes = []
    csv_read
    @recipes
  end

  def csv_read
    CSV.foreach(@file_path) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2], row[3], row[4])
    end
  end

  def add_recipe(recipe)
    @recipes << recipe
    csv_write
  end

  def mark_as_done(index)
    p @recipes[index]
    @recipes[index].do
    csv_write
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    csv_write
  end

  def csv_write
    CSV.open(@file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.time, recipe.difficulty, recipe.done]
      end
    end
  end
end
