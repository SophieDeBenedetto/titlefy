require 'spec_helper'
require 'pry'

describe Titlegen do
  it 'has a version number' do
    expect(Titlegen::VERSION).not_to be nil
  end

  it 'generates a random title' do
    title = Titlegen.generate_title
    title_array = title.split

    expect(title_array.length).to be >= 3  # Will allow titles like: "A Few Red Ants"
  end

  it 'corrects voweled pronouns' do
    allow(Dictionary).to receive(:pronoun).and_return('A')
    pronoun = Titlegen.correctly_voweled_pronoun(adjective = 'unsightly')
    expect(pronoun).to eq 'An'
  end

  it 'corrects pluralized nouns' do
    allow(Dictionary).to receive(:noun).and_return('giraffe')
    # singularize
    expect(Titlegen.correctly_pluralized_noun('A')).to eq('giraffe')
    expect(Titlegen.correctly_pluralized_noun('Her')).to eq('giraffe')
    expect(Titlegen.correctly_pluralized_noun('The')).to eq('giraffe')
    # pluralize
    expect(Titlegen.correctly_pluralized_noun('Some')).to eq('giraffes')
    expect(Titlegen.correctly_pluralized_noun('A Few')).to eq('giraffes')
    expect(Titlegen.correctly_pluralized_noun('No')).to eq('giraffes')
  end
end




