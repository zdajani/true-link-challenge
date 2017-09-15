require 'business_day'

RSpec.describe BusinessDay do
  let(:date) { Date.new(2017, 9, 16) }
  let(:public_holiday_date) { Date.new(2017, 12, 25) }
  describe 'next' do
    subject { BusinessDay.new }

    it 'returns following monday if date is on weekend' do
      expect(subject.next(date)).to eq(Date.new(2017, 9, 18))
    end

    it 'returns following business day if date is on public holiday' do
      expect(subject.next(public_holiday_date)).to eq(Date.new(2017, 12, 26))
    end
  end

  describe 'previous' do
    subject { BusinessDay.new }

    it 'returns previous bussiness day if date is on public holiday' do
      expect(subject.previous(public_holiday_date)).to eq(Date.new(2017, 12, 22))
    end
  end
end
