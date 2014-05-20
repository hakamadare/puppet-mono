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
) {
  validate_bool($development)

  $flavor = $development ? {
    true    => 'MDK',
    default => 'MRE',
  }

  $pkgname = "MonoFramework-${flavor}-${version}.macos10.xamarin.x86"
  $pkgpath = "http://download.mono-project.com/archive/${version}/macos-10-x86/${pkg}.pkg"

  package { $pkgname:
    provider => 'apple',
    source   => $pkgpath,
  }
}
