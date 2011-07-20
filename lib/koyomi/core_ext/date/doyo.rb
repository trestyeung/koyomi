# -*- encoding: UTF-8 -*-
require 'date'
require 'csv'
require 'koyomi/doyo'

module Koyomi
  module CoreExt
    module Date
      module Doyo

        # Returns the doyo(土用) if the date is in one, nil otherwise
        def doyo
          @doyo ||= Koyomi::Doyo.for_date(self)
        end

        # Returns if the date is in a doyo or not.
        def doyo?
          !!doyo
        end
      end
    end
  end
end

class Date
  include ::Koyomi::CoreExt::Date::Doyo
end
