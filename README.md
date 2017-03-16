# docs
All documentation would go here

## Setting Up Development Environment
Steps for setting up development environment for Building FlexSwitch Debian Package for Dell S6000 Platform running Dell NAS.

> - Install Ubuntu 16.04.1 LTS.

> - Install dependent packages

	sudo apt-get update
	sudo apt-get install build-essential git fabric

> - Add following in /etc/apt/sources.list file

	deb http://dl.bintray.com/open-switch/opx-apt jessie main
	deb https://dell-networking.bintray.com/opx-apt jessie main

> - Update Apt Cache

	sudo apt-get update

> - Install Dell CPS development libraries and header files

	wget http://ftp.us.debian.org/debian/pool/main/h/hiredis/libhiredis0.10_0.11.0-4_amd64.deb
	sudo dpkg -i libhiredis0.10_0.11.0-4_amd64.deb 
	sudo apt-get install libopx-cps-dev libopx-base-model-dev

> - Install Golang

	wget https://storage.googleapis.com/golang/go1.5.2.linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf go1.5.2.linux-amd64.tar.gz

> - Setting OPX-FlexSwitch Repository

	mkdir git
	cd git
	git clone https://github.com/open-switch/opx-flxreltools.git reltools
	cd reltools
	fab setupDevEnv

> -  Update .bashrc with following:

	export PATH=$PATH:/usr/local/go/bin
	export SR_CODE_BASE=$HOME/git
	export GOPATH=$SR_CODE_BASE/snaproute/:$SR_CODE_BASE/external/:$SR_CODE_BASE/generated/

> - Run following command

	bash
	cd /home/snaproute/git/reltools

> - Build FlexSwitch Package

	python makePkg.py

> - Look for flexswitch_dellCPS-s6000-snaproute_*_amd64.deb /home/snaproute/git/reltools directory 

## Example Curl Commands

> - To enable Port (e101-001-0)

	curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "e101-001-0", "AdminState":"UP"}'  http://<switch-ip>:8080/public/v1/config/Port

> - To create a Vlan and adding Port as Untagged member of Vlan (Creating Vlan 10 and adding port e101-001-0 as untagged member of Vlan 10)

	curl -H "Content-Type: application/json" -d '{"VlanId":10, "UntagIntfList":["e101-001-0"]}' http://<switch-ip>:8080/public/v1/config/Vlan

> - To create an IPv4 Interface on Bridge Interface (Assigning 100.0.0.0/24 to bridge interface br10)

	curl -H "Content-Type: application/json" -d '{"IpAddr": "100.0.0.2/24", "IntfRef":"br10"}' http://<switch-ip>:8080/public/v1/config/IPv4Intf

> - To create a route policy condition. (Here we are creating a policy condition name "MatchConnected" to match connected routes)

	curl -H "Content-Type: application/json" -d '{"Name":"MatchConnected", "ConditionType":"MatchProtocol", "Protocol":"CONNECTED"}' http://<switch-ip>:8080/public/v1/config/PolicyCondition

> - To create a route policy statement. (Here we are creating a policy statement name "RedistributeConnectedBGP" to redistribute connected route into BGP)

	curl -H "Content-Type: application/json" -d '{"Name":"RedistributeConnectedBGP", "MatchConditions":"all", "Conditions":["MatchConnected"], "Action":"permit"}' http://<switch-ip>:8080/public/v1/config/PolicyStmt

> - To create a route policy defination. (Here we are creating a policy defination name "ImportPolicy" to redistribute all connected route into BGP)

	curl -H "Content-Type: application/json" -d '{"Name":"ImportPolicy", "Priority":1, "MatchType":"all", "StatementList":[{"Priority":1,"Statement":"RedistributeConnectedBGP"}]}' http://<switch-ip>:8080/public/v1/config/PolicyDefinition

> - To create a create a BGP global object. (Local AS Number = 300, Router Id: "10.1.10.190", Redistribute RIB Policy)

	curl -H "Content-Type: application/json" -d '{"Vrf":"default", "ASNum":"300", "RouterId":"10.1.10.190", "Redistribution":[{"Sources":"CONNECTED","Policy":"ImportPolicy"}]}' -X PATCH http://<switch-ip>:8080/public/v1/config/bgpglobal

> - To configure BGP IPv4 Neighbor (Neighbor Address: 100.0.0.1, Peer AS Number: 100, Local AS Number: 300)

	curl -H "Content-Type: application/json" -d '{"NeighborAddress":"100.0.0.1", "IntfRef":"", "PeerAS":"100", "LocalAS":"300", "ConnectRetryTime":30, "HoldTime":3, "KeepaliveTime":1}' -X POST http://<switch-ip>:8080/public/v1/config/bgpv4neighbor

> - To get Port state

	curl -X GET http://<switch-ip>:8080/public/v1/state/Ports | python -m json.tool | more

> - To get Vlan state

	curl -X GET http://<switch-ip>:8080/public/v1/state/Vlans | python -m json.tool | more

> - To get IPv4Intfs state

	curl -X GET http://<switch-ip>:8080/public/v1/state/IPv4Intfs | python -m json.tool | more

> - To get IPv4Routes state

	curl -X GET http://<switch-ip>:8080/public/v1/state/IPv4Routes | python -m json.tool | more

> - To get BGPGlobal state

	curl -X GET http://<switch-ip>:8080/public/v1/state/BGPGlobals | python -m json.tool | more

> - To get BGPv4Neighbors state

	curl -X GET http://<switch-ip>:8080/public/v1/state/BGPv4Neighbors | python -m json.tool | more

> - To get BGPv4Routes state

	curl -X GET http://<switch-ip>:8080/public/v1/state/BGPv4Routes | python -m json.tool | more


## BGPv4 (EBGP) TOPOLOGY
![alt text](https://github.com/open-switch/flx-docs/blob/master/BGP_TOPOLOGY.png "BGPv4 Topology")

## BGPv4 (EBGP) Configuration

> - Switch Mgmt IP: 192.168.100.165

	curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "fpPort49", "AdminState":"UP", "Speed":40000, "Autoneg":"OFF"}'  http://192.168.100.165:8080/public/v1/config/Port
	curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "fpPort50", "AdminState":"UP", "Speed":40000, "Autoneg":"OFF"}'  http://192.168.100.165:8080/public/v1/config/Port
	curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "fpPort1", "AdminState":"UP", "Speed":1000, "Autoneg":"OFF"}'  http://192.168.100.165:8080/public/v1/config/Port
	curl -H "Content-Type: application/json" -d '{"IpAddr": "31.1.10.2/24", "IntfRef":"fpPort49"}' http://192.168.100.165:8080/public/v1/config/IPv4Intf
	curl -H "Content-Type: application/json" -d '{"IpAddr": "51.1.10.2/24", "IntfRef":"fpPort50"}' http://192.168.100.165:8080/public/v1/config/IPv4Intf
	curl -H "Content-Type: application/json" -d '{"IpAddr": "11.1.10.1/24", "IntfRef":"fpPort1"}' http://192.168.100.165:8080/public/v1/config/IPv4Intf
	curl -H "Content-Type: application/json" -d '{"Name":"MatchConnected", "ConditionType":"MatchProtocol", "Protocol":"CONNECTED"}' http://192.168.100.165:8080/public/v1/config/PolicyCondition
	curl -H "Content-Type: application/json" -d '{"Name":"RedistributeConnectedBGP", "MatchConditions":"all", "Conditions":["MatchConnected"], "Action":"permit"}' http://192.168.100.165:8080/public/v1/config/PolicyStmt
	curl -H "Content-Type: application/json" -d '{"Name":"ImportPolicy", "Priority":1, "MatchType":"all", "StatementList":[{"Priority":1,"Statement":"RedistributeConnectedBGP"}]}' http://192.168.100.165:8080/public/v1/config/PolicyDefinition
	curl -H "Content-Type: application/json" -d '{"Vrf":"default", "ASNum":"300", "RouterId":"192.168.100.165", "Redistribution":[{"Sources":"CONNECTED","Policy":"ImportPolicy"}]}' -X PATCH http://192.168.100.165:8080/public/v1/config/bgpglobal
	curl -H "Content-Type: application/json" -d '{"NeighborAddress":"31.1.10.1", "IntfRef":"", "PeerAS":"100", "LocalAS":"300", "ConnectRetryTime":30, "HoldTime":3, "KeepaliveTime":1}' -X POST http://192.168.100.165:8080/public/v1/config/bgpv4neighbor
	curl -H "Content-Type: application/json" -d '{"NeighborAddress":"51.1.10.1", "IntfRef":"", "PeerAS":"200", "LocalAS":"300", "ConnectRetryTime":30, "HoldTime":3, "KeepaliveTime":1}' -X POST http://192.168.100.165:8080/public/v1/config/bgpv4neighbor

> - Switch Mgmt IP: 192.168.100.242

	curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "fpPort49", "AdminState":"UP", "Speed":40000, "Autoneg":"OFF"}'  http://192.168.100.242:8080/public/v1/config/Port
	curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "fpPort50", "AdminState":"UP", "Speed":40000, "Autoneg":"OFF"}'  http://192.168.100.242:8080/public/v1/config/Port
	curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "fpPort1", "AdminState":"UP", "Speed":1000, "Autoneg":"OFF"}'  http://192.168.100.242:8080/public/v1/config/Port
	curl -H "Content-Type: application/json" -d '{"IpAddr": "41.1.10.2/24", "IntfRef":"fpPort49"}' http://192.168.100.242:8080/public/v1/config/IPv4Intf
	curl -H "Content-Type: application/json" -d '{"IpAddr": "61.1.10.2/24", "IntfRef":"fpPort50"}' http://192.168.100.242:8080/public/v1/config/IPv4Intf
	curl -H "Content-Type: application/json" -d '{"IpAddr": "21.1.10.1/24", "IntfRef":"fpPort1"}' http://192.168.100.242:8080/public/v1/config/IPv4Intf
	curl -H "Content-Type: application/json" -d '{"Name":"MatchConnected", "ConditionType":"MatchProtocol", "Protocol":"CONNECTED"}' http://192.168.100.242:8080/public/v1/config/PolicyCondition
	curl -H "Content-Type: application/json" -d '{"Name":"RedistributeConnectedBGP", "MatchConditions":"all", "Conditions":["MatchConnected"], "Action":"permit"}' http://192.168.100.242:8080/public/v1/config/PolicyStmt
	curl -H "Content-Type: application/json" -d '{"Name":"ImportPolicy", "Priority":1, "MatchType":"all", "StatementList":[{"Priority":1,"Statement":"RedistributeConnectedBGP"}]}' http://192.168.100.242:8080/public/v1/config/PolicyDefinition
	curl -H "Content-Type: application/json" -d '{"Vrf":"default", "ASNum":"400", "RouterId":"192.168.100.242", "Redistribution":[{"Sources":"CONNECTED","Policy":"ImportPolicy"}]}' -X PATCH http://192.168.100.242:8080/public/v1/config/bgpglobal
	curl -H "Content-Type: application/json" -d '{"NeighborAddress":"41.1.10.1", "IntfRef":"", "PeerAS":"100", "LocalAS":"400", "ConnectRetryTime":30, "HoldTime":3, "KeepaliveTime":1}' -X POST http://192.168.100.242:8080/public/v1/config/bgpv4neighbor
	curl -H "Content-Type: application/json" -d '{"NeighborAddress":"61.1.10.1", "IntfRef":"", "PeerAS":"200", "LocalAS":"400", "ConnectRetryTime":30, "HoldTime":3, "KeepaliveTime":1}' -X POST http://192.168.100.242:8080/public/v1/config/bgpv4neighbor


> - Switch Mgmt IP: 192.168.100.187

	curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "e101-001-0", "AdminState":"UP"}'  http://192.168.100.187:8080/public/v1/config/Port
	curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "e101-002-0", "AdminState":"UP"}'  http://192.168.100.187:8080/public/v1/config/Port
	curl -H "Content-Type: application/json" -d '{"VlanId":10, "UntagIntfList":["e101-001-0"]}' http://192.168.100.187:8080/public/v1/config/Vlan
	curl -H "Content-Type: application/json" -d '{"VlanId":20, "UntagIntfList":["e101-002-0"]}' http://192.168.100.187:8080/public/v1/config/Vlan
	curl -H "Content-Type: application/json" -d '{"IpAddr": "31.1.10.1/24", "IntfRef":"br10"}' http://192.168.100.187:8080/public/v1/config/IPv4Intf
	curl -H "Content-Type: application/json" -d '{"IpAddr": "41.1.10.1/24", "IntfRef":"br20"}' http://192.168.100.187:8080/public/v1/config/IPv4Intf
	curl -H "Content-Type: application/json" -d '{"Vrf":"default", "ASNum":"100", "RouterId":"192.168.100.187"}' -X PATCH http://192.168.100.187:8080/public/v1/config/bgpglobal
	curl -H "Content-Type: application/json" -d '{"NeighborAddress":"31.1.10.2", "IntfRef":"", "PeerAS":"300", "LocalAS":"100", "ConnectRetryTime":30, "HoldTime":3, "KeepaliveTime":1}' -X POST http://192.168.100.187:8080/public/v1/config/bgpv4neighbor
	curl -H "Content-Type: application/json" -d '{"NeighborAddress":"41.1.10.2", "IntfRef":"", "PeerAS":"400", "LocalAS":"100", "ConnectRetryTime":30, "HoldTime":3, "KeepaliveTime":1}' -X POST http://192.168.100.187:8080/public/v1/config/bgpv4neighbor

> - Switch Mgmt IP: 192.168.100.19

	curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "e101-001-0", "AdminState":"UP"}'  http://192.168.100.19:8080/public/v1/config/Port
	curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "e101-002-0", "AdminState":"UP"}'  http://192.168.100.19:8080/public/v1/config/Port
	curl -H "Content-Type: application/json" -d '{"VlanId":10, "UntagIntfList":["e101-001-0"]}' http://192.168.100.19:8080/public/v1/config/Vlan
	curl -H "Content-Type: application/json" -d '{"VlanId":20, "UntagIntfList":["e101-002-0"]}' http://192.168.100.19:8080/public/v1/config/Vlan
	curl -H "Content-Type: application/json" -d '{"IpAddr": "51.1.10.1/24", "IntfRef":"br10"}' http://192.168.100.19:8080/public/v1/config/IPv4Intf
	curl -H "Content-Type: application/json" -d '{"IpAddr": "61.1.10.1/24", "IntfRef":"br20"}' http://192.168.100.19:8080/public/v1/config/IPv4Intf
	curl -H "Content-Type: application/json" -d '{"Vrf":"default", "ASNum":"200", "RouterId":"192.168.100.19"}' -X PATCH http://192.168.100.19:8080/public/v1/config/bgpglobal
	curl -H "Content-Type: application/json" -d '{"NeighborAddress":"51.1.10.2", "IntfRef":"", "PeerAS":"300", "LocalAS":"200", "ConnectRetryTime":30, "HoldTime":3, "KeepaliveTime":1}' -X POST http://192.168.100.19:8080/public/v1/config/bgpv4neighbor
	curl -H "Content-Type: application/json" -d '{"NeighborAddress":"61.1.10.2", "IntfRef":"", "PeerAS":"400", "LocalAS":"200", "ConnectRetryTime":30, "HoldTime":3, "KeepaliveTime":1}' -X POST http://192.168.100.19:8080/public/v1/config/bgpv4neighbor
