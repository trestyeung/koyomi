# -*- encoding: UTF-8 -*-

require 'koyomi/named_term'
require 'koyomi/solar_term'

module Koyomi
  # A class that represents the doyo(土用).
  #
  # This class supports years from 2011 to 2019.
  class Doyo < NamedTerm

    class << self

      def load_instances #:nodoc:
        params_list = load_csv
        params_list.select{|e|/土用入\z/ =~ e[:name]}.each{|e|e[:name].sub!('入', '')}.map do |params|
          params[:to] = params[:from]
          params[:to] += 1 until (term = ::Koyomi::SolarTerm.for_date(params[:to] + 1)) && /\A立.\z/ =~ term.name
          new(params)
        end
      end
    end
  end
end
