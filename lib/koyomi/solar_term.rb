# -*- encoding: UTF-8 -*-
require 'csv'

module Koyomi
  # A class that represents the solar term(節気).
  # See http://en.wikipedia.org/wiki/Solar_term for detail.
  #
  # This class supports years from 2011 to 2019.
  class SolarTerm

    def initialize(name, from, to) #:nodoc:
      @name = name
      @from = from
      @to = to
    end

    # Returns the name of the term.
    attr_reader :name

    # Returns the first date of the term.
    attr_reader :from

    # Returns the last date of the term.
    attr_reader :to

    alias to_s name

    # Iterates over the term.
    def each
      return to_enum unless block_given?
      (from..to).each {|d| yield(d) }
      self
    end

    class << self

      # Public instantiation is forbidden.
      private :new

      # Returns a SolarTerm instance which the given +date+ is in.
      #
      # +date+:: the date looking for the belonging term.
      def for_date(date)
        cons = SOLAR_TERM_LIST.each_cons(2).detect{|cons| cons[0][0] <= date && date < cons[1][0] }
        raise ArgumentError, 'Only supports years 2011-2019.' unless cons
        new(cons[0][1], cons[0][0], cons[1][0] - 1)
      end

      # List of solar terms.  Each element is a 2-element array in form of [ first-date, name ].
      SOLAR_TERM_LIST = Dir["#{File.join(File.dirname(__FILE__), '../../data')}/skji20{1[1-9],20}.csv"].inject([]) do |days, file|
        CSV.open(file, headers: true, return_headers: false, encoding: 'Windows-31J:UTF-8') do |csv|
          days + csv.map {|row| [::Date.new(*row.values_at('年', '月', '日').map(&:to_i)), row['節気(定気)']] }
        end
      end #:nodoc:

      private_constant :SOLAR_TERM_LIST
    end
  end
end