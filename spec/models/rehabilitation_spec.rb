# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Rehabilitationモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { rehabilitation.valid? }

    let(:user) { create(:user) }
    let!(:rehabilitation) { build(:rehabilitation, user_id: user.id) }

    context 'training_nameカラム' do
      it '空欄でないこと' do
        rehabilitation.training_name = ''
        is_expected.to eq false
      end
    end

    context 'speech_pathological_findings' do
      it '空欄でないこと' do
        rehabilitation.speech_pathological_findings = ''
        is_expected.to eq false
      end
    end

    context 'adaptation_precautions' do
      it '空欄でないこと' do
        rehabilitation.adaptation_precautions = ''
        is_expected.to eq false
      end
    end

    context 'training_content' do
      it '空欄でないこと' do
        rehabilitation.training_content = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Rehabilitation.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end