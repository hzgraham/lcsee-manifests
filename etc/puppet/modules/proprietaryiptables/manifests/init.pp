class proprietaryiptables {

 package {
    'iptables': ensure => present;
    }

  service { 'iptables':
    require => Package["iptables"],

    # Because there is no running process for this service, the normal status
    # checks fail.  Because puppet then thinks the service has been manually
    # stopped, it won't restart it.  This fake status command will trick puppet
    # into thinking the service is *always* running (which in a way it is, as
    # iptables is part of the kernel.)
    hasstatus => true,
    status => "true",

    # Under Debian, the "restart" parameter does not reload the rules, so tell
    # Puppet to fall back to stop/start, which does work.
    hasrestart => false,

    }

  file {
    "/etc/sysconfig/iptables":
      owner   => 'root',
      group   => 'root',
      mode    => 640,
      source  => 'puppet:///files/hostname.rules',
      require => Package["iptables"],

      # When this file is updated, make sure the rules get reloaded.
      notify  => Service["iptables"],
      ;
    }
  } 
