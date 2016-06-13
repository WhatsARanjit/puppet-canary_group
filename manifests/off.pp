application canary::off (
  String $test_node,
  String $test_env,
) {

  canary::group { $title:
    ensure    => 'absent',
    test_node => $test_node,
    test_env  => $test_env,
    export    => Canary_group[$title],
  }

  canary::node { $title:
    consume => Canary_group[$title],
  }

}
