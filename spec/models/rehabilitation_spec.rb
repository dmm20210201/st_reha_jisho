# frozen_string_literal: true

require 'rails_helper'

describe 'Rehabilitaionモデルのテスト' do
  it "有効な投稿内容の場合は保存されるか" do
    expect(FactoryBot.build(:rehabilitaion)).to be_valid
  end
end