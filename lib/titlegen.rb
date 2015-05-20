require "titlegen/version"
require "titlegen/dictionary"
require 'active_support/inflector'

class Titlegen
  

  include Dictionary

  def self.generate_title
    adjective = Dictionary.adjective
    pronoun = self.correctly_voweled_pronoun(adjective)
    noun = self.correctly_pluralized_noun(pronoun)
    self.make_title(pronoun, adjective, noun)
  end

  private

    def self.correctly_voweled_pronoun(adjective)
      pronoun = Dictionary.pronoun
      if vowel?(adjective) && vowel?(pronoun)
        pronoun = "An"
      end
      pronoun
    end

    def self.vowel?(word)
      word.start_with?("a", "e", "i", "o", "u")
    end

    def self.correctly_pluralized_noun(pronoun)
      if pronoun = "Some" || "A Few" || "No"
        Dictionary.noun.pluralize
      else
        Dictionary.noun.singularize
      end
    end

    def self.make_title(pronoun, adjective, noun)
      "#{pronoun} #{adjective} #{noun}".titleize
    end

end


