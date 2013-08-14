-- TI-phy
-- Esoteric phylogenetic inference on TI-Nspire

Node = class()

function Node:init(t,l,r,bl,d)
  self.isTip = t
  self.left = l
  self.right = r
  self.length = bl
  self.datum = d
end

-- Returns true if child added, false if not
function Node:addChild(c)
  if self.isTip then
    return false
  end
  if self.left == nil then
    self.left = c
  else if self.right == nil then
    self.right = c
  else
    return false
  end
  return true
end

function Node:toNewick()
  if self.isTip then
    newick = self.datum
  else
    newick = '(' .. self.left:toNewick() .. ',' .. self.right:toNewick() .. ')'
  end
  return newick .. ':' .. self.length
end

Tree = class()

function Tree:init(r)
  self.root = r
end

function Tree:toNewick
  return self.root:toNewick() .. ';'
end
