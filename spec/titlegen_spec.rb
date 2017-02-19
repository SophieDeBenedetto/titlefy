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
end




