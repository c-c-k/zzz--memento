#!
#
# s6-ex1-convert-to-ldap-record.awk
# This is the awk script for the solution to third exercise of chapter 6.
# It converts input lines in the following (extended regex) form:
# 
#   "(.*meaning.*)( \S)*\t
# 
# To LDAP records in the following format:
# 
#    dn: uid=Username, dc=example, dc=com
#    cn: Firstname Lastname
#    sn: Lastname
#    telephoneNumber: Telephone number
# 

# -- set input field separator to ":" --
BEGIN { 
    FS="\t" ; 
    print "<XML>";
}

# -- print ldap record --
{ print "dn: uid=" $1 ", dc=example, dc=com" }
{ print "cn: " $2 " " $3 }
{ print "sn: " $2 }
{ print "telephoneNumber: " $4 }

END { print </XML> }
