def load_all path
  Dir.foreach(path){|f| require_relative File.join(path,f) if f =~ /.*\.rb/}
end
