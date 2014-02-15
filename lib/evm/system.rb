require 'open3'

module Evm
  class System
    def initialize(executable)
      @executable = executable
    end

    def run(*args)
      stdout, stderr, status = Open3.capture3(command(args))

      if status.success?
        puts stdout
      else
        Evm.abort 'Evm error:', stderr
      end
    end


    private

    def command(args)
      ([@executable] + args).join(' ')
    end
  end
end
