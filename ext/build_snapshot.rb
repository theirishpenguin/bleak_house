RUBY_VERSION = `ruby -v`.split(" ")[1]
require 'mkmf'
$CFLAGS = ENV['CFLAGS']
dir_config('bleak_house_snapshot')
create_makefile('bleak_house_snapshot')
