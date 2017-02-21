require_relative "./titlegen/version"
require_relative "./titlegen/dictionary"
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
      return 'An' if vowel?(adjective) && pronoun == 'A'
      pronoun
    end

    def self.vowel?(word)
      word.start_with?("a", "e", "i", "o", "u")
    end

    def self.correctly_pluralized_noun(pronoun)
      noun = Dictionary.noun
      return noun.pluralize if ['Some','A Few','No'].include? pronoun
      noun.singularize
    end

    def self.make_title(pronoun, adjective, noun)
      "#{pronoun} #{adjective} #{noun}".titleize
    end

end


