require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    context 'messageを保存できる場合' do
      it 'nameがあれば保存できること' do
        expect(build(:message, attachment: nil)).to be_valid
      end
      
      it 'name と attachmentがあれば保存できること' do
        expect(build(:message)).to be_valid
      end
    end

    context 'messageを保存できない場合' do
      it 'name と attachmentが両方空だと保存できないこと' do
        message = build(:message, name: nil, attachment: nil)
        message.valid?
        expect(message.errors[:name]).to include("を入力してください")
      end

      it 'group_idが無いと保存できないこと' do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include("を入力してください")
      end

      it ' user_idが無いと保存できないこと' do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")
      end
    end
  end
end