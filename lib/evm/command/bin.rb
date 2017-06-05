module Evm
  module Command
    class Bin
      def initialize(argv, options = {})
        if (package_name = argv[0])
          package = Evm::Package.find(package_name)
        else
          package = Evm::Package.current
        end

        if package
          STDOUT.puts package.bin
        else
          raise Evm::Exception.new('No current selected')
        end
      end
    end
  end
end
