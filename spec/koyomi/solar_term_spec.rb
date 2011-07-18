# -*- encoding: UTF-8 -*-
require 'koyomi/solar_term'

describe Koyomi::SolarTerm do
  describe '#for_date' do
    context '2011-07-21' do
      subject { Koyomi::SolarTerm.for_date(Date.parse('2011-07-18')) }
      its(:name) { should == '小暑' }
      its(:from) { should == Date.parse('2011-07-07')}
      its(:to) { should == Date.parse('2011-07-19')}
    end

    context '2011-07-21' do
      subject { Koyomi::SolarTerm.for_date(Date.parse('2011-07-21')) }
      its(:name) { should == '夏土用入' }
      its(:from) { should == Date.parse('2011-07-20')}
      its(:to) { should == Date.parse('2011-07-22')}
    end
  end
end
