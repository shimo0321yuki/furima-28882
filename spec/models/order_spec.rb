require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryBot.create(:order) }
 before do
  @order = FactoryBot.build(:order)
end

describe '' do
  it '' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

  it '' do
    @item.name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end