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

	file {"/var/www/html/index.html":
		content => "Hello World!\n",
	}
	
	file {"/home/xubuntu/public_html/index.php":
		content => template("lamp/index.php"),
	}
	
	file {"/etc/apache2/mods-enabled/userdir.conf":
		ensure => "link",
		target => "/etc/apache2/mods-available/userdir.conf",
		notify => Service ["apache2"],
	}

	file {"/etc/apache2/mods-enabled/userdir.load":
		ensure => "link",
		target => "/etc/apache2/mods-available/userdir.load",
		notify => Service ["apache2"],
	}

	file {"/etc/apache2/mods-available/php7.0.conf":
		content => template("lamp/php7.0.conf"),
		notify => Service ["apache2"],
	}

	service {"apache2":
		ensure => "running",
		enable => "true",
		provider => "systemd",
	}
}

