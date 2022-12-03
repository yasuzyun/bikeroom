# frozen_string_literal: true

require 'rails_helper'

  describe 'トップ画面(top_path)のテスト' do
    before do
      visit root_path
    end
    context '表示の確認' do
      it 'トップ画面(top_path)に「bIkEroom」が表示されているか' do
        expect(page).to have_content 'bIkE'
      end
      it 'top_pathが"/top"であるか' do
        expect(current_path).to eq('/')
      end
    end
  
  context "about画面" do
    it "URLが正しい" do
      click_on "概要"
      expect(current_path).to eq "/about"
    end
  end
  
  context "ログイン画面" do
    before do
      click_on "新規登録"
      FactoryBot.create(:customer)
    end
    it "会員ログインができるか" do
      expect(current_path).to eq "/customers/sign_up"
    end
  end
  

end