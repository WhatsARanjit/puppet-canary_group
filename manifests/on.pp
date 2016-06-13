application canary::on (
  String $test_node,
  String $test_env,
) {

  case $::environment {
    'production': {
      $group_export = Canary_group[$title]
      Canary::Group produces Canary_group {}
    }
    default: {
      $node_export = Canary_group[$title]
      Canary::Node produces Canary_group {}
    }
  }
  Canary::Node consumes Canary_group {}

  canary::group { $title:
    test_node => $test_node,
    test_env  => $test_env,
    export    => $group_export,
  }

  canary::node { $title:
    test_node => $test_node,
    test_env  => $test_env,
    export    => $node_export,
    consume   => Canary_group[$title],
  }
}
