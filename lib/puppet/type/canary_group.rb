Puppet::Type.newtype :canary_group, :is_capability => true do
  newparam :name, :is_namevar => true
  newparam :test_node
  newparam :test_env
end
