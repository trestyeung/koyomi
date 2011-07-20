# -*- encoding: UTF-8 -*-
require 'koyomi/doyo'

describe Koyomi::Doyo do
  describe '.for_date' do

    context '2011-07-19' do
      subject { Koyomi::Doyo.for_date(Date.parse('2011-07-19')) }
      it { should be_nil }
    end

    context '2011-07-20 (土用入)' do
      subject { Koyomi::Doyo.for_date(Date.parse('2011-07-20')) }
      its(:name) { should == '夏土用' }
      its(:from) { should == Date.parse('2011-07-20')}
      its(:to) { should == Date.parse('2011-08-07')}
    end

    context '2011-07-23' do
      subject { Koyomi::Doyo.for_date(Date.parse('2011-07-23')) }
      its(:name) { should == '夏土用' }
      its(:from) { should == Date.parse('2011-07-20')}
      its(:to) { should == Date.parse('2011-08-07')}
    end

    context '2011-08-08 (立秋)' do
      subject { Koyomi::Doyo.for_date(Date.parse('2011-08-08')) }
      it { should be_nil }
    end
  end
end
