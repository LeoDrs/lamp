class lamp {
	Package {ensure => "installed", allowcdrom => "true",}
	package {"apache2":}
	package {"mysql-client":}
	package {"mysql-server":}
	package {"php7.0":}
	package {"libapache2-mod-php":
		require => Package ["apache2"],}
	package {"ekiga":}
	package {"gedit":}
	package {"ssh":}
}
