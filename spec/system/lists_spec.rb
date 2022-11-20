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
  
  # describe "[1]会員ログイン後のテスト"  do
  #   before do
  #   visit "/"
  #   click_on "ログイン"
  #   FactoryBot.create(:customer)
  # end
  #   context "マイページ" do 
  #   it "URLが正しい" do
  #     click_on "マイページ"
  #     expect(current_path).to eq "/users/5"
  #   end
  #   it "会員情報編集ボタンがある" do
  #     visit "/users/5"
  #     expect(page).to have_content "会員情報を編集する"
  #     click_on "会員情報を編集する"
  #     expect(current_path).to eq "/users/5/edit"
  #   end
    # it "記事編集ボタンがある" do
    #   visit "/users/5"
    #   expect(page).to have_content "編集する"
    #   click_on "編集する"
    #   expect(current_path).to eq "/articles/1/edit"
    # end
    # it "記事削除ボタンがある" do
    #   visit "/users/1"
    #   expect(page).to have_content "削除する"
    #   click_on "削除する"
    #   expect(current_path).to eq "/articles"
    # end
  # end
  # context "新規登録画面" do
  #   it "URLが正しい" do
  #     click_on "新規登録"
  #     expect(current_path).to eq "/customers/sign_up"
  #   end
  # end
# end
end