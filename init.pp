 class dns::client (
  $nameservers = hiera('dns_nameservers', '10.0.2.71'),
  $domains     = hiera('dns_domains', 'UNKNOWN-DOMAIN.ecm')
) {
  file { '/etc/resolv.conf':
    ensure   => file,
    owner    => '0',
    group    => '0',
    mode     => '0644',
    content  => template('dns/resolv.conf.erb'),
    seluser  => 'system_u',
    seltype  => 'object_r',
    selrole  => 'net_conf_t',
    selrange => 's0',
  }
}
