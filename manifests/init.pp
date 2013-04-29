# Public: Install Emacs.app from homebrew into /Applications.
#
# Examples
#
#   include emacs
class emacs {

  $version = '24.3'

  package { 'emacs':
    install_options => [
      '--cocoa',
      '--srgb'
    ],
    ensure => $version
  }

  $target = "${homebrew::config::installdir}/Cellar/emacs/${version}/Emacs.app"

  file { '/Applications/Emacs.app':
    ensure  => link,
    target  => $target,
    require => Package['emacs']
  }
}
