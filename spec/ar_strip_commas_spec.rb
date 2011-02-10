require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "ArStripCommas" do
  before(:each) do
    class Widget < ActiveRecord::Base
      def self.columns
        @columns ||= [];
      end

      def self.column(name, sql_type = nil, default = nil, null = true)
        columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
      end

      # Override the save method to prevent exceptions.
      def save(validate = true)
        validate ? valid? : true
      end

      column :price, :integer
      column :weight, :float
      column :name, :string
    end
  end
  
  after(:each) do
    Object.send(:remove_const, :Widget)
  end
  
  context "should include class method .strip_commas_from_all_numbers" do
    before(:each) do
      Widget.strip_commas_from_all_numbers
      @widget = Widget.new(:price => "2,810,010", :weight => "1,175.2", :name => "Awesome, Something")
    end
    
    it "that removes commas from strings on integer columns" do
      @widget.price.should == 2810010
    end
    
    it "that removes commas from strings on float columns" do
      @widget.weight.should == 1175.2
    end
    
    it "that does not remove commas from non-numeric columns" do
      @widget.name.should == "Awesome, Something"
    end
  end

  context "should include class method .strip_commas_from method" do
    before(:each) do
      Widget.strip_commas_from :price
      @widget = Widget.new(:price => "2,810,010", :weight => "1,175.2", :name => "Awesome, Something")
    end
    
    it "that removes commas for the specified in column(s)" do
      @widget.price.should == 2810010
    end
    
    it "that does not remove commas from unspecified columns" do
      @widget.weight.should == 1.0
    end
  end
end
