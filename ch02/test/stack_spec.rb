# moo
class Stack
  def initialize
    @elements = []
  end

  def push(element)
    @elements << element
  end

  def top
    @elements.last
  end

  def pop
    @elements.pop
  end
end
describe Stack do
  describe '#push' do
    it 'puts an element at the top of the stack' do
      stack = Stack.new
      stack.push(2)
      stack.push(6)

      expect(stack.top).to eq(6)
    end
  end

  describe '#pop' do
    it 'pop an element from the top of the stack' do
      stack = Stack.new
      stack.push(2)
      stack.push(6)
      stack.pop

      expect(stack.top).to eq(2)
    end
  end
end
