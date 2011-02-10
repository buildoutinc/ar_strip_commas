# ar_strip_commas

This gem adds two class methods to ActiveRecord::Base for automatically handling the conversion of strings with commas ("1,203") to the intended value on numeric columns.

__self.strip_commas_from(*columns)__

Remove commas on the specified column. e.g.

	class Widget < ActiveRecord::Base
	  strip_commas_from :price
	end
	Widget.new(:price => "1,200").price == 1200    # true

__self.strip_commas_from_all_numbers__

Remove commas from all numeric columns. e.g.

	class Widget < ActiveRecord::Base
	  strip_commas_from_all_numbers
	end
	widget = Widget.new(:price => "1,200", :weight => "1,872.0")
	widget.price == 1200     # true
	widget.weight == 1872.0  # true


# Installation

	sudo gem install ar_strip_commas


# The right way?

I'm surprised I couldn't find anything built into rails for handling this. If someone knows the "right way" to handle this, send me an email and I'll replace this project with a readme describing it.


