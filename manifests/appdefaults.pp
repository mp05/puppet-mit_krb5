# == Define: mit_krb5::appdefaults
#
# Configure appdefaults section of krb5.conf
#
# === Parameters
#
#    Four forms possible
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
#  3)
#   realm = {
#     option = value
#   }
#  4)
#   option = value
#
# [*application*]
#  boolean if true use the 'title' as the application name
#
# [*realm*]
#  realm name
#
# [*option*]
#  option / value pairs
#
# === Authors
#
# Mike Phillips
#
# === Copyright
#
# Copyright 2017 Mike Phillips.
#
define mit_krb5::appdefaults(
  $application         = '',
  $app_realm           = '',
  $app_options         = {},
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
