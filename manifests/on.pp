application canary::on (
  String $test_node,
  String $test_env,
) {

  case $::environment {
    'production': {
      Canary::Group produces Canary_group {}
    }
    default: {
      Canary::Node produces Canary_group {}
    }
  }
  Canary::Node consumes Canary_group {}

  canary::group { $title:
    test_node => $test_node,
    test_env  => $test_env,
    export    => Canary_group[$title],
  }

  canary::node { $title:
    test_node => $test_node,
    test_env  => $test_env,
    consume   => Canary_group[$title],
  }
}
