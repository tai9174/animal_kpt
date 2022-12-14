require 'rails_helper'
RSpec.describe 'KPT管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  describe 'ユーザ登録のテスト' do
    context 'ユーザの新規登録した場合' do
      it '作成したユーザーログインできる' do
        visit new_user_registration_path
        fill_in "user[name]", with:"test_name00"
        fill_in "user[password]", with:"test_password"
        fill_in "user[password_confirmation]", with:"test_password"
        click_on "登録"
        expect(page).to have_content 'test_name00のKPT一覧'
      end
    end  
    context 'ログインせずマイKPT一覧画面に飛ぼうとした場合' do
      it 'ログイン画面に遷移すること' do
        visit kpts_path
        expect(page).to have_content 'ログイン'
      end
    end
  end
  describe '管理者機能のテスト' do
    context '管理者がadmin画面を見ようと場合' do
      it '管理者画面が見れる' do
        visit new_user_session_path
        fill_in "user[name]", with:"admin_name"
        fill_in "user[password]", with:"admin_password"
        click_on "ログイン"
        click_on "管理者画面"
        expect(page).to have_content 'Animal Kpt Admin'
      end
    end
  end
  describe 'プロフィール機能のテスト' do
    before do
      visit new_user_session_path
      fill_in "user[name]", with:"test_name"
      fill_in "user[password]", with:"test_password"
      click_on "ログイン"
    end
    context 'プロフィール画面表示した場合' do
      it 'ユーザーの名前が表示される' do
        visit users_show_path
        expect(page).to have_content 'test_name'
      end
    end
    context 'プロフィールを編集画面に移動場合' do
      it 'ユーザーが編集される' do
        visit users_show_path
        visit edit_user_registration_path
        fill_in "user[name]", with:"test_name1"
        fill_in "user[current_password]", with:"test_password"  
        click_on "更新"
        expect(page).to have_content 'アカウント情報が更新されました'
      end
      it 'ユーザー情報の削除ができる' do
        visit edit_user_registration_path
        click_on '消す'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'ログイン'
      end
    end
  end
end