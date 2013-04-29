# Public: Install Emacs.app from homebrew into /Applications.
#
# Examples
#
#   include emacs
class emacs {
  require homebrew

  $version = '24.3'

  homebrew::formula { 'emacs':
    before => Package['boxen/brews/emacs'],
    install_options => [
      '--cocoa',
      '--srgb'
    ]
  }

  package { 'boxen/brews/emacs':
    ensure => $version
  }

  $target = "${homebrew::config::installdir}/Cellar/emacs/${version}/Emacs.app"

  file { '/Applications/Emacs.app':
    ensure  => link,
    target  => $target,
    require => Package['boxen/brews/emacs']
  }
}
