require "open-uri"
require "nokogiri"
require "open-uri"
require "nokogiri"

class Scraper

  def search(word)
    @url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{word}"
    @doc = Nokogiri::HTML(open(@url).read, nil, 'utf-8')
    results = []

    temp_array = []
    # @doc
    @doc.search('.m_contenu_resultat').each_with_index do |element, index|
      # p element

      name = element.search('.m_titre_resultat a').text  #.m_titre_resultat a
      #p "name = #{name}"
      description = element.search('.m_texte_resultat').text[30..-1]  #.m_texte_resultat
      #p "desc = #{description}"
      prep_time = element.search('.m_detail_time').text[5..-1]

      # p prep_time

      details = element.search('.m_detail_recette').text.split("-")[2].chomp

      #p details
      temp_array[index] = Recipe.new(name, description, prep_time, details)
    end

    # temp_array2 = []

    # @doc.search('.m_texte_resultat').each_with_index do |element, index|
    #   temp_array2[index] = element.text
    # end

    # temp_array.each_with_index do |name, index|
    #   hash_temp = {
    #     name: name,
    #     description: temp_array2[index][30..-1]
    #   }

    #   results[index] = hash_temp
    # end
    temp_array
  end

end

##############################################################################################################################################################################
# parsing.rb
# require 'open-uri'
# require 'nokogiri'


# html_file = File.open("strawberry.html")
# p html_file
# url = 'http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=strawberry'
# doc = Nokogiri::HTML(open(url).read, nil, 'utf-8')
# # web_text = doc.text.strip
# # p web_text
# results = []

# temp_array = []
# doc.search('.m_titre_resultat a').each_with_index do |element, index|
#   temp_array[index] = element.text
# end

# temp_array2 = []

# doc.search('.m_texte_resultat').each_with_index do |element, index|
#   temp_array2[index] = element.text
# end

# temp_array.each_with_index do |name, index|
#   hash_temp = {
#     name: name,
#     description: temp_array2[index][30..-1]
#   }

#   results[index] = hash_temp
# end

# p results
