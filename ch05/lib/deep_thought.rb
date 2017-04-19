# DeepThought
class DeepThought
  def initialize(printer)
    @printer = printer
    @printer.print("Hello, I'm the DeepThought super computer...")
  end

  def print_the_answer
    @printer.print('42')
  end
end
