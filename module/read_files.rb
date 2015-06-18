module ReadFiles

  def initialize_array_from_files(klass, *files)
    lines_array = read_lines_from_files(*files)
    prepared_lines_array = prepare_array(lines_array)
    prepared_lines_array.each { |p| klass.new(p) }
  end

  def read_lines_from_files(*relative_file_paths)
    lines_array = []
    relative_file_paths.each do |file_path|
      file = File.new("#{file_path}")
      file.each { |line| lines_array << line }
    end
    lines_array
  end

  def prepare_array(array)
    array.collect { |string| prepare(string) }
  end

end