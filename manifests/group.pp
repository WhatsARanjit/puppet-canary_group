define canary::group (
  String $test_node,
  String $test_env,
  String $ensure       = 'present',
  String $parent_group = '00000000-0000-4000-8000-000000000000',
) {

  node_group { "Canary Group - ${title}":
    ensure               => $ensure,
    environment          => $test_env,
    override_environment => true,
    parent               => $parent_group,
    rule                 => ['or', ['=', 'name', $test_node]]
  }
}

Canary::Group produces Canary_group {}
