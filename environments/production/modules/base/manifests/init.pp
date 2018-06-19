class base {
	case $::osfamily{
		"redhat": {
			$pacotes = ["fish","epel-release","git","vim","sysstat","htop","sl","figlet"]
		}
		"debian": {
			$pacotes = ["fish","git","vim","sysstat","htop","cowsay","sl","figlet"]
			exec{"Atualiza repos":
				command => "/usr/bin/apt update"
			}
		}
	}
	package{$pacotes:
		ensure => present
	}

	file{'/root/.bashrc':
		source => "puppet:///modules/base/bashrc_base", 
		ensure => present
	}
        
	user{'devops':
		ensure => present,
		managehome => yes,
		shell => "/usr/bin/fish"	
	}
}
