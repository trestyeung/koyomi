# -*- encoding: UTF-8 -*-
require 'koyomi/solar_term'

describe Koyomi::SolarTerm do
  describe '.for_date' do
    context '2011-07-18' do
      subject { Koyomi::SolarTerm.for_date(Date.parse('2011-07-18')) }
      its(:name) { should == '小暑' }
      its(:from) { should == Date.parse('2011-07-07')}
      its(:to) { should == Date.parse('2011-07-22')}
    end

    context '2011-07-23' do
      subject { Koyomi::SolarTerm.for_date(Date.parse('2011-07-23')) }
      its(:name) { should == '大暑' }
      its(:from) { should == Date.parse('2011-07-23')}
      its(:to) { should == Date.parse('2011-08-07')}
    end
  end
end
