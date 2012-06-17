
class propconfig {

      include proprietarysshd
      include myid
      include proprietarymotd
      include proprietaryiptables
#     include sudoers
#      include propcloud      
# screen is useful
package {
   'screen': ensure => installed;
   }
# so is nmap
package {
   'nmap': ensure => installed;
   }
}
