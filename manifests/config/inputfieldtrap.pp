#
# == Class: trac::config::inputfieldtrap
#
# Install InputFieldTrap
#
class trac::config::inputfieldtrap {

    include ::trac::params

    file { 'trac-inputfieldtrap-directory':
        name    => "/usr/local/lib/python${::trac::params::python_version}/dist-packages/inputfieldtrapplugin",
        owner   => root,
        group   => root,
        source  => 'puppet:///modules/trac/inputfieldtrapplugin',
        recurse => true,
        require => Class['::trac::install'],
    }

    exec { 'trac-inputfieldtrap-install':
        cwd     => "/usr/local/lib/python${::trac::params::python_version}/dist-packages/inputfieldtrapplugin/0.11",
        command => 'python setup.py install',
        onlyif  => 'test ! -d /usr/local/lib/python*/dist-packages/inputfieldtrap*',
        path    => [ '/usr/local/bin', '/usr/bin' ],
        require => File['trac-inputfieldtrap-directory'],
    }
}
