class Tree
  attr_accessor :children, :node_name

  def self.from_hash(hash)
    hash.collect do |key, value|
      children = from_hash(value)
      Tree.new(key, children)
    end
  end

  def initialize(name, children=[])
    @children= children
    @node_name= name
  end

  def visit_all(level=0, &block)
    visit level, &block
    children.each { |c| c.visit_all level + 1, &block }
  end

  def visit(level=0, &block)
    block.call self, level
  end
end

data = {
  'grandpa' => {
    'dad' => {
      'child1' => {},
      'child2' => {}
    },
    'uncle' => {
      'child3' => {},
      'child4' => {}
    }
  }
}

trees = Tree.from_hash(data)
tree = trees.first
tree.visit_all do |node, level|
  if level > 0
    print "  " * (level - 1)
    print "+ "
  end
  puts node.node_name
end
