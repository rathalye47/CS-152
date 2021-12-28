class Tree
  attr_accessor :value, :left, :right
  def initialize(value, left=nil, right=nil)
    @value = value
    @left = left
    @right = right
  end

  def each_node(temp)
    unless left.nil?
      left.each_node(temp)
    end

    temp.call(value)

    unless right.nil?
      right.each_node(temp)
    end
  end

  def method_missing m
    ms = m.to_s
    ms.gsub!(/_/, '.')
    puts ms
    eval "self.#{ms}"
  end
end


my_tree = Tree.new(42,
                   Tree.new(3,
                            Tree.new(1,
                                     Tree.new(7,
                                              Tree.new(22),
                                              Tree.new(123)),
                                     Tree.new(32))),
                   Tree.new(99,
                            Tree.new(81)))

tree_print = proc { |v| puts v }
my_tree.each_node(tree_print)
                                                    
arr = []
array_add = proc { |v| arr.push v }
my_tree.each_node(array_add)
p arr
