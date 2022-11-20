# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, "Articleモデルに関するテスト", type: :model do
  before do
    FactoryBot.create(:customer)
  end
  
  describe "記事データの保存" do
    it "有効なデータを保存できるか？" do
      expect(FactoryBot.build(:article)).to be_valid
    end
    
    context "空白のバリデーションチェック" do
      it "投稿ユーザー(user_id)が空の時、保存できない" do
        article = Article.new(customer_id: "", title: Faker::Lorem.characters(number: 10), body: Faker::Lorem.characters(number: 100))
        expect(article).to be_invalid
      end
      it "タイトル(title)が空の時、保存できない" do
        article = Article.new(customer_id: 1, title: "", body: Faker::Lorem.characters(number: 100))
        expect(article).to be_invalid
      end
      it "本文(content)が空の時、保存できない" do
        article = Article.new(customer_id: 1, title: Faker::Lorem.characters(number: 10), body: "")
        expect(article).to be_invalid
      end
    end
  end
end