# -*- encoding: UTF-8 -*-
require 'date'

module Koyomi
  module CoreExt
    module Date
      module StemAndBranch

        MJD_BASE_OFFSET = 50 # 1858-11-17(MJD origin) is '甲寅' (51th) #:nodoc:
        STEM_LIST = '甲乙丙丁戊己庚辛壬癸'.chars.to_a #:nodoc:
        BRANCH_LIST = '子丑寅卯辰巳午未申酉戌亥'.chars.to_a #:nodoc:
        private_constant :MJD_BASE_OFFSET, :STEM_LIST, :BRANCH_LIST

        # Returns the heavenly stem (干) of the date.
        def stem
          offset = MJD_BASE_OFFSET + mjd
          @stem ||= STEM_LIST[offset % 10]
        end

        # Returns the earthly branch (支) of the date.
        def branch
          offset = MJD_BASE_OFFSET + mjd
          @branch ||= BRANCH_LIST[offset % 12]
        end
      end
    end
  end
end

class Date
  include ::Koyomi::CoreExt::Date::StemAndBranch
end
