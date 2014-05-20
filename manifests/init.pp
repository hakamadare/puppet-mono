# Public: Install Mono MRE or MDK.
#
# Examples
#
#  class { 'mono':
#    version     => '3.4.0',
#    development => true,
#  }
class mono (
  $version     = '3.4.0',
  $development = false,
  $cachedir    = '/opt/boxen/cache',
) {
  validate_bool($development)

  $flavor = $development ? {
    true    => 'MDK',
    default => 'MRE',
  }

  $pkgname = "MonoFramework-${flavor}-${version}.macos10.xamarin.x86"
  $pkgpath = "http://download.mono-project.com/archive/${version}/macos-10-x86/${pkgname}.pkg"
  $pkgcache = "${cachedir}/${pkgname}.pkg"

  package { 'wget':
    ensure          => 'present',
    provider        => 'homebrew',
    install_options => [
      '--enable-iri',
    ],
  } ->
  fetchfile { $pkgcache:
    downloadurl     => $pkgpath,
    downloadfile    => "${pkgname}.pkg",
    downloadto      => '/tmp/',
    desintationpath => $pkgcache,
    owner           => $::boxen_user,
    group           => 'staff',
    mode            => '0644',
    extrapaths      => [ '/opt/boxen/homebrew/bin' ],
    compression     => 'uncompressed',
  } ->
  package { $pkgname:
    provider => 'apple',
    source   => $pkgcache,
  }
}
