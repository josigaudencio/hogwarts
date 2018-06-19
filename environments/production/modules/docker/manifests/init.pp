class docker {
	case $::osfamily{
		"redhat": {
			$pacotes = ["yum-utils","device-mapper-persistent-data","lvm2"]

			exec{"Stable repository":
				command => "yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo"
			}
		}

		"debian": {
			$pacotes = ["docker-ce"]
			exec{"Atualiza repos":
				command => "/usr/bin/apt update"
			}
		}
	}

	package{$pacotes:
		ensure => present
	}
}
