require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:subject) { described_class.new }

  let(:article_two) { Article.new }
  
  it "is invalid without required parameters" do
    expect(subject).to be_invalid
  end

  it "is valid with all of its parameters" do
    subject.title = "A"
    subject.body  = "abcd"
  
    expect(subject).to be_valid
  end

  pending "is valid with required parameters, where optional parameters are omitted"
  pending "is subject to input sanitisation"

  it "has unique parameters" do
    subject.title = "A"
    subject.body  = "abcd"
    subject.save

    article_two.title = subject.title
    article_two.body  = subject.body
    
    # expect(article_two).to(be_invalid)
    article_two.valid?
    expect(article_two.errors.full_messages.first).to(include("has already been taken"))
  end

  context "*Title* attribute's conditions" do
    before(:each) do
      subject.body = 'abcd'
    end

    context "include `presence: true` guard" do
      it 'is rejected if value of `Title` is `nil`' do
        subject.title = nil
        expect(subject).to(be_invalid)
      end
      
      it 'is rejected if value of `Title` is empty/blank' do
        subject.title = ''
        expect(subject).to(be_invalid)
      end

      it 'is rejected if value of `Title` is only spaces' do
        subject.title = ' '
        expect(subject).to(be_invalid)
      end
    end #context

    pending "satisfies max. boundary (length)"
    pending "fails max. + 1 boundary (length)"

    pending "conforms to UTF-8"
    #   subject.title = "😃 , 1% é اب تک ( }"
    #   expect { subject.save }.to(change { Article.count }.by(1))
    # end
  end #context "*Title* attribute's conditions"

  context "*Body* attribute's conditions" do
    before(:each) do
      subject.title = "A"
    end

    pending "satisfies max. boundary (length)"
    pending "fails max. + 1 boundary (length)"
 
    context "ensure `presence: true` guard on *Body* attribute" do
      it 'is rejected if value of `Body` is is `nil`' do
        subject.body = nil
        expect(subject).to(be_invalid)
      end
      
      it 'is rejected if value of `Body` is empty/blank' do
        subject.body = ''
        expect(subject).to(be_invalid)
      end

      it 'is rejected if value of `Body` is only spaces' do
        subject.body = ' '
        expect(subject).to(be_invalid)
      end
    end #context

    pending "conforms to UTF-8"
  end #context "*Body* attribute's conditions"
end #file
