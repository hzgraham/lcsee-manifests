class proprietarymotd {

# Make sure that the lcsee.banner and the motd are updated in /etc/
# requires sshd_config file
file { '/etc/lcsee.banner' :
       source => 'puppet:///files/prop_lcsee.banner',
       owner   => 'root',
       group   => 'root',
       mode    => '640',
       notify  => Service['sshd'], # sshd will restart whenever you edit this file.
       require => Package['openssh-server'],
        }
file { '/etc/motd' :
       source => 'puppet:///files/prop_motd',
       owner   => 'root',
       group   => 'root',
       mode    => '640',
       notify  => Service['sshd'], # sshd will restart whenever you edit this file.
       require => Package['openssh-server'],
        }
service { 'sshd':
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true,
}
}


