define solid::database {
  class { '::mongodb::globals':
    manage_package_repo => true,
    version             => '2.4.10'
  }->
  class { '::mongodb::server': }

  class { '::mysql::server': }
}