require_relative 'spec_helper'

describe Netflix do

  before :all do
    @netflix = Netflix.new
  end

  it 'each movie has period ' do
    expect(@netflix.all.map(&:period)).not_to eq nil
  end

  it 'each movie has price' do
    expect(@netflix.all.map(&:price)).not_to eq nil
  end

  describe '#show' do
    context 'when not enough money' do
      subject { @wallet = 0 }
      xit 'raise an error' do
        expect {  }
        .to raise_error("You don't have enough money.")
      end
    end

    context 'when enough money' do
      xit 'show random movie and withdraw money' do
        subject { @wallet = 20 }
        expect(@netflix.show(year: 2010..2015, genre: 'Drama'))
        .to
      end
    end
  end

  describe '#pay' do
    xit 'add money to wallet' do
      expect(netflix.pay(100)).to
    end
  end

  describe '#how_much?' do
    xit 'return price for selected movie' do
      expect(netflix.how_much?('The Terminator')).to
    end
  end

end