#node default { }

node 'dev-box' {

	# Tomcat7 is used as application server.
	exec { 'wget tomcat7':
		command => '/usr/bin/wget -q -P /home/dev/Downloads/osgp - https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.62/bin/apache-tomcat-7.0.62.tar.gz',
		before => Exec['wget postgresql jdbc','unpack tomcat7','change permissions of tomcat7 conf files'],	
		returns => [0, 4],
	}

	exec { 'unpack tomcat7':
		command => '/bin/tar xzf /home/dev/Downloads/osgp/apache-tomcat-7.0.62.tar.gz -C /home/dev/Tools',
		before => Exec['wget postgresql jdbc','change permissions of tomcat7 conf files'],
	}

	exec { 'change permissions of tomcat7 conf files':
		command => '/bin/chmod 644 /home/dev/Tools/apache-tomcat-7.0.62/conf/*',
	}

	# A JDBC is needed by Tomcat7 to connect to PostgreSQL.
	exec { 'wget postgresql jdbc':
		command => '/usr/bin/wget -q -P /home/dev/Tools/apache-tomcat-7.0.62/lib - https://jdbc.postgresql.org/download/postgresql-9.4.1208.jre7.jar',
		returns => [0, 4],
	}
}
