require "ar_strip_commas/version"

module ArStripCommas
end

module ActiveRecord
  class Base
    def self.strip_commas_from_all_numbers
      class_eval do
        def write_attribute_with_strip_commas(attr_name, value)
          if self.class.columns_hash[attr_name].try(:number?) && value.is_a?(String) && value.present?
            value = value.gsub(",", "")
          end
          write_attribute_without_strip_commas(attr_name, value)
        end
        alias_method_chain :write_attribute, :strip_commas
      end
    end
  end
end