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
#define mit_krb5::appdefaults() {
#  fail('PLACEHOLDER: Not yet implemented')
#}
define mit_krb5::appdefaults(
  $application         = {},
  $app_realm           = '',
  $app_option          = '',
) {
  include mit_krb5
  ensure_resource('concat::fragment', 'mit_krb5::appdefaults_header', {
    target  => $mit_krb5::krb5_conf_path,
    order   => '12appdefaults_header',
    content => "[appdefaults]\n",
  })
  concat::fragment { "mit_krb5::appdefaults::${title}":
    target  => $mit_krb5::krb5_conf_path,
    order   => "13realm_${title}",
    content => template('mit_krb5/appdefaults.erb'),
  }
}
