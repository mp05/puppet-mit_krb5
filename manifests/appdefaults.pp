# == Define: mit_krb5::appdefaults
#
# Configure appdefaults section of krb5.conf
#
# === Parameters
#
# [*application*]
#    Two forms possible either a hash  or a nested hash
#  1)
#    application = {
#      option1 = value
#      option2 = value
#    }
#  2)
#   application = {
#      realm1 = {
#        option = value
#      }
#     realm2 = {
#        option = value
#     }
#   }
# 
# [*realm*]
#  option / value pairs in hash
#
# [*option*]
#  option / value pairs
#
# === Authors
#
# Patrick Mooney <patrick.f.mooney@gmail.com>
#
# === Copyright
#
# Copyright 2013 Patrick Mooney.
#
define mit_krb5::appdefaults() {
  fail('PLACEHOLDER: Not yet implemented')
}
