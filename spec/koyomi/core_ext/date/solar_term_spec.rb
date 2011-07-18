# -*- encoding: UTF-8 -*-
require 'koyomi/core_ext/date/solar_term'

describe Date do
  describe '#solar_term' do
    context 'for 2011-07-18' do
      subject { Date.parse('2011-07-18').solar_term }
      its(:name) { should == '小暑' }
      its(:from) { should == Date.parse('2011-07-07')}
      its(:to) { should == Date.parse('2011-07-19')}
    end

    context 'for 2011-07-21' do
      subject { Date.parse('2011-07-21').solar_term }
      its(:name) { should == '夏土用入' }
      its(:from) { should == Date.parse('2011-07-20')}
      its(:to) { should == Date.parse('2011-07-22')}
    end
  end
end
