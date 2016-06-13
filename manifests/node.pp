define canary::node {
  notify { "${test_node} being tested in ${test_env}":
    loglevel => debug,
  }
}

Canary::Node consumes Canary_group {
  test_node => $test_node,
  test_env  => $test_env,
}
