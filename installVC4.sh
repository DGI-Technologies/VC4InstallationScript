#!/bin/bash
scriptPath=`pwd`
os=`cat /proc/version |  grep "bos.redhat.com" | cut -f1 -d" "`
if [ -z $os ] 
then 
	os=`cat /proc/version | grep "bsys.centos.org" | cut -f1 -d" "`
	if [ -z $os ]
	then 
		echo "RPM Not Compatible In This Operating System!!!"
		exit
	else
		os="CENTOS"
		echo "Operating System : CentOS"
		OpenSsl="openssl-devel-1.1.1c-15.el8.i686"
		LibAtomic="libatomic-8.3.1-5.el8.0.2.i686"
		LibCurl="libcurl-7.61.1-12.el8.i686"
		NetSnmp="net-snmp-agent-libs-1:5.8-14.el8_2.1.i686"
		RedisCLI="redis-5.0.3-2.module_el8.2.0+318+3d7e67ea.x86_64"
                NetSnmplib="net-snmp-libs-1:5.8-14.el8_2.1.i686"

	fi 
dnf config-manager --add-repo ./crestron.repo
dnf config-manager --add-repo ./crestron1.repo

else	
	os="RHEL"
	echo "Operating System : Red Hat"
	OpenSsl="openssl-devel-1:1.1.1c-2.el8.i686"
	LibAtomic="libatomic-8.3.1-5.el8.i686"
	LibCurl="libcurl-7.61.1-8.el8.i686"
	NetSnmp="net-snmp-agent-libs-1:5.8-7.el8_0.2.i686"
	RedisCLI="redis-5.0.3-1.module+el8+2566+19ca22c8.x86_64"
        NetSnmplib="net-snmp-libs-1:5.8-7.el8.i686"

fi

echo " " >> /tmp/.vc4InstallationLog.txt

echo "Installing Required Packages" >> /tmp/.vc4InstallationLog.txt
subscription-manager auto-attach

cd /opt/ 
if dnf -y  install zip unzip

then
	echo "Installed zip unzip " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install zip unzip " >> /tmp/.vc4InstallationLog.txt
	
 exit
fi 

if dnf -y  install tar

then
	echo "Installed tar  " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install tar " >> /tmp/.vc4InstallationLog.txt
	
 exit
fi 


if dnf -y  install telnet

then
	echo "Installed telnet  " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install telnet " >> /tmp/.vc4InstallationLog.txt
	
 exit
fi 

if dnf  -y install glibc-devel.i686

then
	echo "Installed glibc-devel.i686 " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install glibc-devel.i686 " >> /tmp/.vc4InstallationLog.txt
	
 exit
fi 

if [ "$os" = "CENTOS1" ]
then
	rm -f /var/lib/rpm/__db*
	rm -f /var/lib/rpm/.rpm.lock
	if dnf  -y install selinux-policy-targeted-3.14.3-41.el8_2.5.noarch

	then
		echo "Installed selinux-policy-targeted-3.14.3-41.el8_2.5.noarch " >> /tmp/.vc4InstallationLog.txt
	else
		echo "Failed to install selinux-policy-targeted-3.14.3-41.el8_2.5.noarch " >> /tmp/.vc4InstallationLog.txt
		
	 exit
	fi 
else
	echo""
fi

if dnf  -y install rsync
then
	echo "Installed rsync " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install rsync " >> /tmp/.vc4InstallationLog.txt
	
 exit
fi 

if dnf  -y install policycoreutils-python-utils 
then
	echo "Installed policycoreutils-python-utils  " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install policycoreutils-python-utils  " >> /tmp/.vc4InstallationLog.txt
	
 exit
fi 

if dnf  -y install glibc-devel
then
	echo "Installed glibc-devel " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install glibc-devel " >> /tmp/.vc4InstallationLog.txt
	
 exit
fi 


if dnf  -y install libstdc++.i686
then
	echo "Installed libstdc++.i686 " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install libstdc++.i686 " >> /tmp/.vc4InstallationLog.txt
	
 exit
fi 


if dnf  -y install $OpenSsl
then
	echo "Installed $OpenSsl " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install $OpenSsl " >> /tmp/.vc4InstallationLog.txt

 exit
fi 

if dnf  -y install yajl-2.1.0-10.el8.i686
then
	echo "Installed yajl-2.1.0-10.el8.i686 " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install yajl-2.1.0-10.el8.i686 " >> /tmp/.vc4InstallationLog.txt
	
 exit
fi 


if dnf  -y install $LibCurl
then
	echo "Installed $LibCurl " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install $LibCurl " >> /tmp/.vc4InstallationLog.txt
 exit
fi 

if dnf  -y install libuuid.i686
then
	echo "Installed libuuid.i686 " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install libuuid.i686 " >> /tmp/.vc4InstallationLog.txt
	
 exit
fi 



if dnf  -y install $LibAtomic
then
	echo "Installed $LibAtomic " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install $LibAtomic " >> /tmp/.vc4InstallationLog.txt

 exit
fi 

if dnf  -y install libevent-devel-2.1.8-5.el8.i686
then
	echo "Installed libevent-devel-2.1.8-5.el8.i686 " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install libevent-devel-2.1.8-5.el8.i686 " >> /tmp/.vc4InstallationLog.txt
 exit
fi 


if dnf  -y install $NetSnmp
then
	echo "Installed $NetSnmp " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install $NetSnmp " >> /tmp/.vc4InstallationLog.txt
 exit
fi 

if dnf  -y install $NetSnmplib 
then
	echo "Installed net-snmp-libs-1:5.8-14.el8.i686  " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install net-snmp-libs-1:5.8-14.el8.i686  " >> /tmp/.vc4InstallationLog.txt

 exit
fi 


if dnf  -y install mariadb-server
then
	echo "Installed mariadb-server " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install mariadb-server " >> /tmp/.vc4InstallationLog.txt
 exit
fi 

if dnf  -y install httpd
then
	echo "Installed httpd " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install http " >> /tmp/.vc4InstallationLog.txt
 exit
fi 


if systemctl enable httpd
then
	echo "Enabled httpd " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to Enable httpd " >> /tmp/.vc4InstallationLog.txt
 exit
fi 

if dnf  -y install mod_security
then
	echo "Installed mod_security " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install mod_security " >> /tmp/.vc4InstallationLog.txt
 exit
fi 




if dnf  -y install net-snmp
then
	echo "Installed net-snmp " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install net-snmp " >> /tmp/.vc4InstallationLog.txt
	exit
fi 

if dnf  -y install net-snmp-utils
then
	echo "Installed net-snmp-utils " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install net-snmp-utils " >> /tmp/.vc4InstallationLog.txt
 exit
fi 

if dnf -y install krb5-workstation 
then
	echo "Installed krb5-workstation " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install krb5-workstation" >> /tmp/.vc4InstallationLog.txt
 exit
fi


if dnf -y install krb5-libs
then
	echo "Installed krb5-libs " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install krb5-libs " >> /tmp/.vc4InstallationLog.txt
 exit
fi


if dnf -y install openldap-clients-2.4.46-11.el8_1.x86_64
then
	echo "Installed openldap-clients-2.4.46-11.el8_1.x86_64 " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install openldap-clients-2.4.46-11.el8_1.x86_64 " >> /tmp/.vc4InstallationLog.txt
 exit
fi

if dnf -y install $RedisCLI
then
	echo "Installed $RedisCLI " >> /tmp/.vc4InstallationLog.txt
else
	echo "Failed to install $RedisCLI " >> /tmp/.vc4InstallationLog.txt
 exit
fi

if dnf -y install python3-virtualenv
then 
	echo "Installed python3-virtualenv " >> /tmp/.vc4InstallationLog.txt
else
	echo " Failed to install python3-virtualenv" >> /tmp/.vc4InstallationLog.txt
fi


if dnf -y install libcgroup-tools
then
        echo "Installed libcgroup-tools" >> /tmp/.vc4InstallationLog.txt
else
        echo " Failed to install libcgroup-tools" >> /tmp/.vc4InstallationLog.txt
fi



cd $scriptPath
echo "Installing VC4 RPM " >> /tmp/.vc4InstallationLog.txt
rpm -Uvh --oldpackage virtualcontrolForEG-2.4557.00147-1.noarch.rpm 

./DBMigrations.sh
