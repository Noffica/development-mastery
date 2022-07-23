require 'rails_helper'

RSpec.describe Article, type: :model do
  subject { described_class.new }
  
  it "is invalid without required parameters" do
    expect(subject).to be_invalid
  end

  it "is valid with all of its parameters" do
    subject.title = "A"
    subject.body  = "abcdefg"
    
    expect(subject).to be_valid
  end

  it "is valid with required parameters, where optional parameters are omitted"

  it "has unique parameters"

  it "'Title' attribute satisfies boundary conditions"
  # = nil
  # blank space
  # min.
  # min. -1
  # max.
  # max. + 1

  it "'Body' attribute satisfies boundary conditions"
  
  it "'Title' attribute accepts special characters"
  # punctuation
  # numbers
  # accented Latin characters
  # non-Latin characters e.g. Greek, Cyrillic, Arabic/Persian
  # UTF-8 emojis

  it "'Body' attribute accepts special characters"

  it "'Title' attribute is subject to sanitation of its input"
  it "'Body' attribute is subject to sanitation of its input"
end
