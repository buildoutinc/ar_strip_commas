module ActiveRecord
  class Base
    
    def self.strip_commas_from(*columns)
      unless (self.respond_to?(:write_attribute_without_strip_commas))
        class_eval do
          def write_attribute_with_strip_commas(f, v)
            if (self.class.strip_commas_fields.include?(f.to_sym) && v.is_a?(String))
              write_attribute_without_strip_commas(f, v.gsub(",", ""))
            else
              write_attribute_without_strip_commas(f, v)
            end
          end

          alias_method_chain :write_attribute, :strip_commas
          cattr_accessor :strip_commas_fields
          self.strip_commas_fields = []
        end
      end

      columns.each do |column|
        self.strip_commas_fields << column.to_sym
      end
    end
    
    def self.strip_commas_from_all_numbers
      class_eval do
        def convert_number_column_value(value)
          if value == false
            0
          elsif value == true
            1
          elsif value.is_a?(String)
            if (value.blank?)
              nil
            else
              value.gsub(",", "")
            end
          else
            value
          end
        end
      end
    end
    
  end
end