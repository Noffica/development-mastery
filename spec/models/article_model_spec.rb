require 'rails_helper'

# #build*, #create are from FactoryBot

RSpec.describe Article, type: :model do
  let(:subject) { described_class.new }

  let(:article_two) { Article.new }

  context "when considering all data attributes" do
    it "is invalid without required parameters" do
      # expect(subject).to be_invalid
      expect(build(:article, :no_attributes)).to(be_invalid)
    end

    it "is valid with all of its parameters" do
      # subject.title = "A"
      # subject.body  = "abcd"
    
      expect(build(:article, :valid_attributes)).to(be_valid)
    end

    pending "is valid with required parameters, where optional parameters are omitted"
    pending "is subject to input sanitisation"

    it "has unique parameters" do
      create(:article, :valid_attributes)
      duplicate_attempt = build(:article, :valid_attributes)
      duplicate_attempt.valid?

      expect(
        duplicate_attempt.errors.full_messages.first
      ).to(
        include("has already been taken")
      )

      # subject.title = "A"
      # subject.body  = "abcd"
      # subject.save

      # article_two.title = subject.title
      # article_two.body  = subject.body
      
      # article_two.valid?
      # expect(article_two.errors.full_messages.first).to(include("has already been taken"))
    end
  end #context

  context "when checking the *Title* attribute and fixing the Body attribute" do
    # before(:each) do
      # subject.body = 'abcd'
    # end

    let(:article_one) { build(:article, body: 'abcd') }

    context "include `presence: true` guard" do
      it 'is rejected if `Title` is `nil`' do
        # expect(article_one).to(be_invalid)
        expect(
          build(:article, :body_attribute_only)
        ).to(
          be_invalid
        )
        # subject.title = nil
        # expect(subject).to(be_invalid)
      end

      it 'is rejected if `Title` is empty/blank' do
        expect(
          build(:article, :body_attribute_only, title: '')
        ).to(
          be_invalid
        )
        
        # article_one.title = ''
        # expect(article_one).to(be_invalid)

        # subject.title = ''
        # expect(subject).to(be_invalid)
      end

      it 'is rejected if `Title` is only spaces' do
        expect(
          build(:article, :body_attribute_only, title: ' ')
        ).to(
          be_invalid
        )

        # subject.title = ' '
        # expect(subject).to(be_invalid)
      end
    end #context

    pending "satisfies max. boundary (length)"
    pending "fails max. + 1 boundary (length)"

    pending "conforms to UTF-8"
  end #context

  context "when checking the *Body* attribute and fixing the Title attribute" do
    before(:each) do
      subject.title = "A"
    end

    pending "satisfies max. boundary (length)"
    pending "fails max. + 1 boundary (length)"
 
    context "ensure `presence: true` guard on *Body* attribute" do
      it 'is rejected if value of `Body` is is `nil`' do
        expect(
          build(:article, :title_attribute_only)
        ).to(
          be_invalid
        )
        
        # subject.body = nil
        # expect(subject).to(be_invalid)
      end
      
      it 'is rejected if `Body` is empty/blank' do
        expect(
          build(:article, :title_attribute_only, body: '')
        ).to(
          be_invalid
        )
        # subject.body = ''
        # expect(subject).to(be_invalid)
      end

      it 'is rejected if value of `Body` is only spaces' do
        expect(
          build(:article, :title_attribute_only, body: ' ')
        ).to(
          be_invalid
        )
        # subject.body = ' '
        # expect(subject).to(be_invalid)
      end
    end #context

    pending "conforms to UTF-8"
  end #context
end #file
