require 'rails_helper'

# #build*, #create are from FactoryBot

RSpec.describe Article, type: :model do
  context "when considering all data attributes" do
    it "is invalid without required parameters" do
      expect(
        build(:article, :no_attributes)
      ).to(
        be_invalid
      )
    end

    it "is valid with all of its parameters" do
      expect(
        build(:article, :valid_attributes)
      ).to(
        be_valid
      )
    end

    it "has unique parameters" do
      create(:article, :valid_attributes)
      duplicate_attempt = build(:article, :valid_attributes)
      duplicate_attempt.valid?

      expect(
        duplicate_attempt.errors.messages[:body] #search for error by relevant entity
      ).to(
        include("has already been taken")
      )
    end
  end #context

  context "when checking the *Title* attribute and fixing the Body attribute" do
    context "include `presence: true` guard" do
      it 'is rejected if `Title` is `nil`' do
        expect(
          build(:article, :body_attribute_only)
        ).to(
          be_invalid
        )
      end

      it 'is rejected if `Title` is empty/blank' do
        expect(
          build(:article, :body_attribute_only, title: '')
        ).to(
          be_invalid
        )
      end

      it 'is rejected if `Title` is only spaces' do
        expect(
          build(:article, :body_attribute_only, title: ' ')
        ).to(
          be_invalid
        )
      end
    end #context

    pending "satisfies max. boundary (length)" #Issue 20 on GitHub
    pending "fails max. + 1 boundary (length)" #Issue 20 on GitHub
  end #context

  context "when checking the *Body* attribute and fixing the Title attribute" do
    context "ensure `presence: true` guard on *Body* attribute" do
      it 'is rejected if value of `Body` is is `nil`' do
        expect(
          build(:article, :title_attribute_only)
        ).to(
          be_invalid
        )
      end

      it 'is rejected if `Body` is empty/blank' do
        expect(
          build(:article, :title_attribute_only, body: '')
        ).to(
          be_invalid
        )
      end

      it 'is rejected if `Body` is only spaces' do
        expect(
          build(:article, :title_attribute_only, body: ' ')
        ).to(
          be_invalid
        )
      end
    end #context
  end #context
end #file
