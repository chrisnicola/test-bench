module TestBench
  class ExpandPath
    include InternalLogging

    attr_reader :dir
    attr_reader :root_directory

    def initialize root_directory, dir
      @dir = dir
      @root_directory = root_directory
    end

    def self.build root_directory
      dir = Dir

      root_directory = Pathname(root_directory)

      instance = new root_directory, dir
      instance
    end

    def call pattern
      logger.debug do
        "Scanning for files (Pattern: #{pattern.inspect}, Root Directory: #{root_directory.to_s.inspect})"
      end

      full_pattern = root_directory.join pattern

      if full_pattern.directory?
        full_pattern = full_pattern.join '**/*.rb'
      end

      files = dir[full_pattern.to_s].map do |file|
        pathname = Pathname.new file
        pathname = pathname.relative_path_from root_directory
        pathname.to_s
      end

      logger.debug do
        "Scanned for files (Pattern: #{pattern.inspect}, Root Directory: #{root_directory.to_s.inspect}, Matches: #{files.size})"
      end

      files
    end
  end
end
