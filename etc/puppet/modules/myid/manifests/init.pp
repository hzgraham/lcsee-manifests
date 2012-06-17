# This class configures a server to use myid authentication by replacing the nsswitch.conf and the system-auth-ac
# files with preconfigured files in the /etc/puppet/files/ directory of the puppet master

class myid {
#file { '/etc/nsswitch.conf' :
#       source => 'puppet:///files/nsswitch.conf',
#       owner   => 'root',
#       group   => 'root',
#       mode    => '644',
#        }

file { '/etc/pam.d/system-auth-ac' :
       source => 'puppet:///files/system-auth-ac',
       owner   => 'root',
       group   => 'root',
       mode    => '644',
        }

#file { '/etc/sysconfig/authconfig' :
#       source => 'puppet:///files/authconfig',
#       owner   => 'root',
#       group   => 'root',
#       mode    => '644',
#        }

#file { '/etc/openldap/ldap.conf' :
#       source => 'puppet:///files/prop.ldap.ldap.conf',
#       owner   => 'root',
#       group   => 'root',
#       mode    => '644',
#        }
#file { '/etc/openldap/ldap.conf' :
#       source => 'puppet:///files/prop.ldap.ldap.conf',
#       owner   => 'root',
#       group   => 'root',
#       mode    => '644',
#        }



exec { "/usr/bin/authconfig --ldapserver=ldap://ldapconsumer.lcsee.wvu.edu --ldapbasedn=dc=lcsee,dc=wvu,dc=edu --enableldap --enableldapauth --update": }
}