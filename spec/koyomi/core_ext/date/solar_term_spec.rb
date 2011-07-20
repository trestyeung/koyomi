# -*- encoding: UTF-8 -*-
require 'koyomi/core_ext/date/solar_term'

describe Date do
  describe '#solar_term' do
    context 'for 2011-07-18' do
      subject { Date.parse('2011-07-18').solar_term }
      its(:name) { should == '小暑' }
      its(:from) { should == Date.parse('2011-07-07')}
      its(:to) { should == Date.parse('2011-07-22')}
    end

    context 'for 2011-07-23' do
      subject { Date.parse('2011-07-23').solar_term }
      its(:name) { should == '大暑' }
      its(:from) { should == Date.parse('2011-07-23')}
      its(:to) { should == Date.parse('2011-08-07')}
    end
  end
end
