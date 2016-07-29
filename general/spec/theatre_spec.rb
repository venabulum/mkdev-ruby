require_relative '../theatre'

describe Theatre do

  before :all do
    @theatre = Theatre.new
  end

  it 'each movie has period ' do
    expect(@theatre.all.map(&:period)).not_to eq nil
  end

  describe '#show' do
    xit 'return available movie for selected time' do
      expect(theatre.show('10:30')).to
    end
  end

  describe '#when?' do
    xit 'return time when movie will be show' do
      expect(theatre.how_much?('The Terminator')).to
    end
  end

end