lib_dir = File.expand_path '../lib', __FILE__
unless $LOAD_PATH.include? lib_dir
  $LOAD_PATH.unshift lib_dir
end

require 'test_bench'
