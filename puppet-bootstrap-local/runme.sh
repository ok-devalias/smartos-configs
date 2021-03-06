#  script to coordinate puppetlabs exercise 		#
########################################
#  This set of bash scripts prepares a server		#
#  with puppet, nginx, and git, then applies	#
#  a puppet manifest to set its role.						#
#  Functional and tested on:									#
#  SmartOS, Debian 6, Ubuntu 10.04 + 12.04	#
#  and CentOS 6.5												   		#
#  Expects root, but should be expanded to		#
#  use sudo when possible										#
########################################

echo "Puppet Labs - Exercise Webpage"
echo
echo
echo "Automate all the operating systems!"
echo "Puppet Bootstrap script is functional on: "
echo "-------------------------------------------------------"
echo " -SmartOS instances"
echo " -Ubuntu 10.04"
echo " -Ubuntu 12.04"
echo " -Debian 6"
echo " -CentOS 6"
echo " -Fedora 18"
echo " -Probably RHEL!"
echo
echo
sleep 2

echo "Starting puppet bootstrap process."
./pupbootstrap.sh 2> /dev/null

if [ ! $? == 0 ]; then
	echo "Something went wrong in bootstrap."
	exit 1
fi

echo "Puppet bootstrap process completed."
echo
echo "Starting module install process."
./pupmodule-inst.sh 2> /dev/null

if [ ! $? == 0 ]; then
	echo "Something went wrong in the module installation process."
	exit 1
fi

echo "Module install process completed."
echo
echo "Applying puppet manifest."
./pupapply.sh 2> /dev/null

if [ ! $? == 0 ]; then
	echo "Something went wrong in the puppet apply process."
	exit 1
fi

echo "Puppet manifest applied."
echo
./pupinfo.sh

