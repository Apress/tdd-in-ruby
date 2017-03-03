class StandardConsole
  def initialize(input = $stdin, output=$stdout)
    @input = input
    @output = output
  end

  def prompt
    @output.puts "Please enter a number from 1 to 100\n"
    read.to_i
  end

  def write(message)
    @output.print message
  end

  def read
    @input.gets.chomp
  end
end