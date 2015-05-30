require 'spec_helper'

describe GetFrozen do
  it 'has a version number' do
    expect(GetFrozen::VERSION).not_to be nil
  end
  
  context '#get_frozen' do

    context 'For value objects' do
      ['string', /regex/, [], {}, 1..2, Time.now].each do |obj|
        context "#{obj.class}" do
          it 'is duplicated' do
            expect(obj.get_frozen).not_to be(obj)
          end
          
          it 'is same value as original' do
            expect(obj.get_frozen).to eq(obj)
          end
  
          it 'returns same object when frozen' do
            obj.freeze
            expect(obj.get_frozen).to be(obj)
          end
        end
      end
    end
    
    context 'For objects not considered as value' do
      [Object.new, lambda{},].each do |obj|
      context "#{obj.class}" do
        it 'is duplicated' do
          expect(obj.get_frozen).not_to be(obj)
        end
        
        it 'returns same object when frozen' do
          obj.freeze
          expect(obj.get_frozen).to be(obj)
        end
      end
      end
    end
  
    context 'For specially-handled immutable objects' do
      [
        1, 1.2, true, false, nil, Complex(1), Rational(1,2), 10**1000,
        :symbol, 
      ].each do |obj|
        context "#{obj.class}" do
          it 'causes no error' do
            expect {obj.get_frozen}.not_to raise_error
          end
          it 'is same value as original' do
            expect(obj.get_frozen).to eq(obj)
          end
        end
      end
    end
  end
end
