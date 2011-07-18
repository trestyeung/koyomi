# -*- encoding: UTF-8 -*-
require 'koyomi/core_ext/date/stem_and_branch'

describe Date do
  describe '#stem' do
    context 'UNIX Epoch' do
      subject { Date.parse('1970-01-01') }
      its(:stem) { should == '辛' }
    end

    context 'MJD 0' do
      subject { Date.parse('1858-11-17') }
      its(:stem) { should == '甲' }
    end

    context '平成23年1月9日(甲子)' do
      subject { Date.parse('2011-01-09') }
      its(:stem) { should == '甲' }
    end

  end

  describe '#branch' do
    context 'UNIX Epoch' do
      subject { Date.parse('1970-01-01') }
      its(:branch) { should == '巳' }
    end

    context 'MJD 0' do
      subject { Date.parse('1858-11-17') }
      its(:branch) { should == '寅' }
    end

    context '平成23年1月9日(甲子)' do
      subject { Date.parse('2011-01-09') }
      its(:branch) { should == '子' }
    end

  end
end