# -*- encoding: UTF-8 -*-
require 'koyomi/core_ext/date/doyo'

describe Date do
  describe '#doyo' do
    context 'for 2011-07-19' do
      subject { Date.parse('2011-07-19').doyo }
      it { should_not be }
    end

    context 'for 2011-07-20 (土用入)' do
      subject { Date.parse('2011-07-20').doyo }
      its(:name) { should == '夏土用' }
      its(:from) { should == Date.parse('2011-07-20') }
      its(:to) { should == Date.parse('2011-08-07') }
    end

    context 'for 2011-08-07 (土用明)' do
      subject { Date.parse('2011-08-07').doyo }
      its(:name) { should == '夏土用' }
      its(:from) { should == Date.parse('2011-07-20') }
      its(:to) { should == Date.parse('2011-08-07') }
    end

    context 'for 2011-08-08 (立秋)' do
      subject { Date.parse('2011-08-08').doyo }
      it { should_not be }
    end
  end

  describe '#doyo?' do
    context 'for 2011-07-19' do
      subject { Date.parse('2011-07-19').doyo? }
      it { should be_false }
    end

    context 'for 2011-07-20 (土用入)' do
      subject { Date.parse('2011-07-20').doyo? }
      it { should be_true }
    end

    context 'for 2011-08-07 (土用明)' do
      subject { Date.parse('2011-08-07').doyo? }
      it { should be_true }
    end

    context 'for 2011-08-08 (立秋)' do
      subject { Date.parse('2011-08-08').doyo? }
      it { should be_false }
    end
  end
end
