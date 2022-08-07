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

  it "has unique parameters" do
    subject.title = "A"
    subject.body  = "abcd"
    subject.save

    article_two.title = subject.title
    article_two.body  = subject.body
    expect(article_two).to(be_invalid)
  end

  context "*Title* attribute's conditions" do
    before(:each) do
      subject.body = 'abcd'
    end

    context "include `presence: true` guard" do
      it 'is rejected if value is `nil`' do
        subject.title = nil
        expect(subject).to(be_invalid)
      end
      
      it 'is rejected if empty/blank' do
        subject.title = ''
        expect(subject).to(be_invalid)
      end

      it 'is rejected if only spaces' do
        subject.title = ' '
        expect(subject).to(be_invalid)
      end
    end #context

    pending "satisfies max. boundary (length)"
    pending "fails max. + 1 boundary (length)"
    
    it "conforms to UTF-8" do
      subject.title = "😃 , 1% é اب تک ( }"
      expect { subject.save }.to(change { Article.count }.by(1))
      # expect(subject).to(be_valid)
    end
  end #context "*Title* attribute's conditions"

  context "*Body* attribute's conditions" do
    before(:each) do
      subject.title = "A"
    end

    pending "satisfies max. boundary (length)"
    pending "fails max. + 1 boundary (length)"
 
    context "ensure `presence: true` guard on *Body* attribute" do
      it 'is rejected if value is `nil`' do
        subject.body = nil
        expect(subject).to(be_invalid)
      end
      
      it 'is rejected if empty/blank' do
        subject.body = ''
        expect(subject).to(be_invalid)
      end

      it 'is rejected if only spaces' do
        subject.body = ' '
        expect(subject).to(be_invalid)
      end
    end #context

    it "conforms to UTF-8" do
      subject.body = "😃 , 1% é اب تک ( }"
      expect { subject.save }.to(change { Article.count }.by(1))
      # expect(subject).to(be_valid)
    end
  end #context "*Body* attribute's conditions"
end #file
