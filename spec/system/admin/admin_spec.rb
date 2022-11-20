# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admins', type: :system do
  click_on "管理者用"
  # あらかじめ管理者を作成しておく
  let(:admin) { FactoryBot.create(:admin) }

  describe '管理者用ログイン' do
    context 'ログインに成功する場合' do
      it 'ログインするとホーム画面に遷移する' do
        visit new_admin_session_path
        fill_in 'log_in_admin_email__input', with: admin.email
        fill_in 'log_in_admin_password__input', with: admin.password
        click_button 'ログイン'
        expect(page).to have_current_path admin_path
      end
    end
 end
end

