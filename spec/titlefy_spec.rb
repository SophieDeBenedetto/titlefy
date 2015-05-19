require 'spec_helper'
require 'pry'

describe Titlefy do
  it 'has a version number' do
    expect(Titlefy::VERSION).not_to be nil
  end

  it 'generates a random title' do
    title = Titlefy.generate_title
    title_array = title.split

    expect(title_array.length).to eq 3
  end
end




