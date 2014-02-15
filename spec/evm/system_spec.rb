require 'spec_helper'

describe Evm::System do
  before do
    @system = Evm::System.new('command')

    @stdout = 'STDOUT'
    @stderr = 'STDERR'
    @status = double('status', :success? => true)

    Open3.stub(:capture3).and_return([@stdout, @stderr, @status])
  end

  describe '#run' do
    it 'should run when no arguments' do
      Open3.should_receive(:capture3).with('command')

      @system.run
    end

    it 'should run with single argument' do
      Open3.should_receive(:capture3).with('command foo')

      @system.run('foo')
    end

    it 'should run with single argument' do
      Open3.should_receive(:capture3).with('command foo bar')

      @system.run('foo', 'bar')
    end

    it 'should raises exception when command fails' do
      @status.stub(:success?).and_return(false)

      expect {
        @system.run('boom')
      }.to raise_error(SystemExit)
    end
  end
end
