DhcpIntfConfig Object
=============================================================

*config/DhcpIntfConfig*
------------------------------------

- Multiple objects of this type can exist in a system.

+--------------------+---------------+--------------------------------+-------------+------------------+
| **PARAMETER NAME** | **DATA TYPE** |        **DESCRIPTION**         | **DEFAULT** | **VALID VALUES** |
+--------------------+---------------+--------------------------------+-------------+------------------+
| IntfRef **[KEY]**  | string        | Interface name or ifindex      | N/A         | N/A              |
|                    |               | of L3 interface object on      |             |                  |
|                    |               | which Dhcp Server need to be   |             |                  |
|                    |               | configured                     |             |                  |
+--------------------+---------------+--------------------------------+-------------+------------------+
| BroadcastAddr      | string        | Broadcast Address DEFAULT      | N/A         | N/A              |
+--------------------+---------------+--------------------------------+-------------+------------------+
| DNSServerAddr      | string        | Comma seperated List of DNS    | N/A         | N/A              |
|                    |               | Server Address DEFAULT         |             |                  |
+--------------------+---------------+--------------------------------+-------------+------------------+
| DomainName         | string        | Domain Name Address DEFAULT    | N/A         | N/A              |
+--------------------+---------------+--------------------------------+-------------+------------------+
| Subnet             | string        | Subnet                         | N/A         | N/A              |
+--------------------+---------------+--------------------------------+-------------+------------------+
| SubnetMask         | string        | Subnet Mask                    | N/A         | N/A              |
+--------------------+---------------+--------------------------------+-------------+------------------+
| Enable             | bool          | Enable and Disable Control     | N/A         | N/A              |
|                    |               | DEFAULT                        |             |                  |
+--------------------+---------------+--------------------------------+-------------+------------------+
| IPAddrRange        | string        | Range of IP Addresses DEFAULT  | N/A         | N/A              |
+--------------------+---------------+--------------------------------+-------------+------------------+
| RouterAddr         | string        | Router Address DEFAULT         | N/A         | N/A              |
+--------------------+---------------+--------------------------------+-------------+------------------+



*OpxFlexSwitch CURL API Supported*
------------------------------------

	- GET By Key
		 curl -X GET -H 'Content-Type: application/json' --header 'Accept: application/json' -d '{<Model Object as json-Data>}' http://device-management-IP:8080/public/v1/config/DhcpIntfConfig
	- GET By ID
		 curl -X GET http://device-management-IP:8080/public/v1/config/DhcpIntfConfig/<uuid>
	- GET ALL
		 curl -X GET http://device-management-IP:8080/public/v1/config/DhcpIntfConfigs?CurrentMarker=<x>&Count=<y>
	- CREATE(POST)
		 curl -X POST -H 'Content-Type: application/json' --header 'Accept: application/json' -d '{<Model Object as json-Data>}' http://device-management-IP:8080/public/v1/config/DhcpIntfConfig
	- DELETE By Key
		 curl -X DELETE -i -H 'Accept:application/json' -d '{<Model Object as json data>}' http://device-management-IP:8080/public/v1/config/DhcpIntfConfig
	- DELETE By ID
		 curl -X DELETE http://device-management-IP:8080/public/v1/config/DhcpIntfConfig<uuid>
	- UPDATE(PATCH) By Key
		 curl -X PATCH -H 'Content-Type: application/json' -d '{<Model Object as json data>}'  http://device-management-IP:8080/public/v1/config/DhcpIntfConfig
	- UPDATE(PATCH) By ID
		 curl -X PATCH -H 'Content-Type: application/json' -d '{<Model Object as json data>}'  http://device-management-IP:8080/public/v1/config/DhcpIntfConfig<uuid>


*OpxFlexSwitch SDK API Supported:*
------------------------------------



- **GET**


::

	import sys
	import os
	from opxflexswitchV2 import OpxFlexSwitch

	if __name__ == '__main__':
		switchIP := "192.168.56.101"
		swtch = OpxFlexSwitch (switchIP, 8080)  # Instantiate object to talk to flexSwitch
		response, error = swtch.getDhcpIntfConfig(IntfRef=intfref)

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'


- **GET By ID**


::

	import sys
	import os
	from opxflexswitchV2 import OpxFlexSwitch

	if __name__ == '__main__':
		switchIP := "192.168.56.101"
		swtch = OpxFlexSwitch (switchIP, 8080)  # Instantiate object to talk to flexSwitch
		response, error = swtch.getDhcpIntfConfigById(ObjectId=objectid)

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'




- **GET ALL**


::

	import sys
	import os
	from opxflexswitchV2 import OpxFlexSwitch

	if __name__ == '__main__':
		switchIP := "192.168.56.101"
		swtch = OpxFlexSwitch (switchIP, 8080)  # Instantiate object to talk to flexSwitch
		response, error = swtch.getAllDhcpIntfConfigs()

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'


- **CREATE**

::

	import sys
	import os
	from opxflexswitchV2 import OpxFlexSwitch

	if __name__ == '__main__':
		switchIP := "192.168.56.101"
		swtch = OpxFlexSwitch (switchIP, 8080)  # Instantiate object to talk to flexSwitch
		response, error = swtch.createDhcpIntfConfig(IntfRef=intfref, BroadcastAddr=broadcastaddr, DNSServerAddr=dnsserveraddr, DomainName=domainname, Subnet=subnet, SubnetMask=subnetmask, Enable=enable, IPAddrRange=ipaddrrange, RouterAddr=routeraddr)

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'


- **DELETE**

::

	import sys
	import os
	from opxflexswitchV2 import OpxFlexSwitch

	if __name__ == '__main__':
		switchIP := "192.168.56.101"
		swtch = OpxFlexSwitch (switchIP, 8080)  # Instantiate object to talk to flexSwitch
		response, error = swtch.deleteDhcpIntfConfig(IntfRef=intfref)

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'


- **DELETE By ID**

::

	import sys
	import os
	from opxflexswitchV2 import OpxFlexSwitch

	if __name__ == '__main__':
		switchIP := "192.168.56.101"
		swtch = OpxFlexSwitch (switchIP, 8080)  # Instantiate object to talk to flexSwitch
		response, error = swtch.deleteDhcpIntfConfigById(ObjectId=objectid

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'


- **UPDATE**

::

	import sys
	import os
	from opxflexswitchV2 import OpxFlexSwitch

	if __name__ == '__main__':
		switchIP := "192.168.56.101"
		swtch = OpxFlexSwitch (switchIP, 8080)  # Instantiate object to talk to flexSwitch
		response, error = swtch.updateDhcpIntfConfig(IntfRef=intfref, BroadcastAddr=broadcastaddr, DNSServerAddr=dnsserveraddr, DomainName=domainname, Subnet=subnet, SubnetMask=subnetmask, Enable=enable, IPAddrRange=ipaddrrange, RouterAddr=routeraddr)

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'


- **UPDATE By ID**

::

	import sys
	import os
	from opxflexswitchV2 import OpxFlexSwitch

	if __name__ == '__main__':
		switchIP := "192.168.56.101"
		swtch = OpxFlexSwitch (switchIP, 8080)  # Instantiate object to talk to flexSwitch
		response, error = swtch.updateDhcpIntfConfigById(ObjectId=objectidBroadcastAddr=broadcastaddr, DNSServerAddr=dnsserveraddr, DomainName=domainname, Subnet=subnet, SubnetMask=subnetmask, Enable=enable, IPAddrRange=ipaddrrange, RouterAddr=routeraddr)

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'
