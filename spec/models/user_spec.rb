require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザ新規登録テスト' do
    context 'nameとpasswordが規定の文字数以上ある' do
      it 'アカウントが新規で作成される' do
        enough_info = FactoryBot.build(:user)
        expect(enough_info).to be_valid
      end
    end
    context '名前が空の場合' do
      it 'バリデーションエラー(nameのNull制約)となり失敗する' do
        empty_password = FactoryBot.build(:user, name: nil)
        expect(empty_password).not_to be_valid
      end
    end
    context '名前が文字不足の場合' do
      it 'バリデーションエラー(nameの文字数制限)となり失敗する' do
        not_enough_name = FactoryBot.build(:user, name: 'n')
        expect(not_enough_name).not_to be_valid
      end
    end
    context 'passwordが空の場合' do
      it 'バリデーションエラー(passwordのNull制約)となり失敗する' do
        empty_password = FactoryBot.build(:user, password: nil)
        expect(empty_password).not_to be_valid
      end
    end
    context 'passwordが文字不足の場合' do
      it 'バリデーションエラー(passwordの文字数制限)となり失敗する' do
        not_enough_password = FactoryBot.build(:user, password: 'pass')
        expect(not_enough_password).not_to be_valid
      end
    end
  end
end