define canary::node (
  String $test_node,
  String $test_env,
) {
  notify { "${test_node} being tested in ${test_env}":
    loglevel => debug,
  }
}

if $environment != 'production' {
  Canary::Node produces Canary_group {}
}
Canary::Node consumes Canary_group {}
