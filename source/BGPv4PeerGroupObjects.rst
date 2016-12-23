BGPv4PeerGroup Object
=============================================================

*config/BGPv4PeerGroup*
------------------------------------

- Multiple objects of this type can exist in a system.

+-------------------------+---------------+--------------------------------+-------------+------------------+
|   **PARAMETER NAME**    | **DATA TYPE** |        **DESCRIPTION**         | **DEFAULT** | **VALID VALUES** |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| Name **[KEY]**          | string        | Name of the BGP peer group     | N/A         | N/A              |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| AddPathsRx              | bool          | Receive additional paths from  | false       | N/A              |
|                         |               | BGP neighbor                   |             |                  |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| RouteReflectorClient    | bool          | Set/Clear BGP neighbor as a    | false       | N/A              |
|                         |               | route reflector client         |             |                  |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| UpdateSource            | string        | Source IP to connect to the    |             | N/A              |
|                         |               | BGP neighbor                   |             |                  |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| MultiHopEnable          | bool          | Enable/Disable multi hop for   | false       | N/A              |
|                         |               | BGP neighbor                   |             |                  |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| PeerAS                  | string        | Peer AS of the BGP neighbor    |             | N/A              |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| MaxPrefixes             | uint32        | Maximum number of prefixes     |           0 | N/A              |
|                         |               | that can be received from the  |             |                  |
|                         |               | BGP neighbor                   |             |                  |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| MaxPrefixesDisconnect   | bool          | Disconnect the BGP peer        | false       | N/A              |
|                         |               | session when we receive the    |             |                  |
|                         |               | max prefixes from the neighbor |             |                  |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| MaxPrefixesRestartTimer | uint8         | Time to wait before we start   |           0 | N/A              |
|                         |               | BGP peer session when we       |             |                  |
|                         |               | receive max prefixes           |             |                  |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| MaxPrefixesThresholdPct | uint8         | The percentage of maximum      |          80 | N/A              |
|                         |               | prefixes before we start       |             |                  |
|                         |               | logging                        |             |                  |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| AdjRIBOutFilter         | string        | Policy that is applied for     |             | N/A              |
|                         |               | Adj-RIB-Out prefix filtering   |             |                  |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| ConnectRetryTime        | uint32        | Connect retry time to          |           0 | N/A              |
|                         |               | connect to BGP neighbor after  |             |                  |
|                         |               | disconnect                     |             |                  |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| NextHopSelf             | bool          | Use neighbor source IP as the  | false       | N/A              |
|                         |               | next hop for IBGP neighbors    |             |                  |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| HoldTime                | uint32        | Hold time for the BGP neighbor |           0 | N/A              |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| KeepaliveTime           | uint32        | Keep alive time for the BGP    |           0 | N/A              |
|                         |               | neighbor                       |             |                  |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| LocalAS                 | string        | Local AS of the BGP neighbor   |             | N/A              |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| MultiHopTTL             | uint8         | TTL for multi hop BGP neighbor |           0 | N/A              |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| AddPathsMaxTx           | uint8         | Max number of additional paths |           0 | N/A              |
|                         |               | that can be transmitted to BGP |             |                  |
|                         |               | neighbor                       |             |                  |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| AdjRIBInFilter          | string        | Policy that is applied for     |             | N/A              |
|                         |               | Adj-RIB-In prefix filtering    |             |                  |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| AuthPassword            | string        | Password to connect to the BGP |             | N/A              |
|                         |               | neighbor                       |             |                  |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| Description             | string        | Description of the BGP         |             | N/A              |
|                         |               | neighbor                       |             |                  |
+-------------------------+---------------+--------------------------------+-------------+------------------+
| RouteReflectorClusterId | uint32        | Cluster Id of the internal     |           0 | N/A              |
|                         |               | BGP neighbor route reflector   |             |                  |
|                         |               | client                         |             |                  |
+-------------------------+---------------+--------------------------------+-------------+------------------+



*OpxFlexSwitch CURL API Supported*
------------------------------------

	- GET By Key
		 curl -X GET -H 'Content-Type: application/json' --header 'Accept: application/json' -d '{<Model Object as json-Data>}' http://device-management-IP:8080/public/v1/config/BGPv4PeerGroup
	- GET By ID
		 curl -X GET http://device-management-IP:8080/public/v1/config/BGPv4PeerGroup/<uuid>
	- GET ALL
		 curl -X GET http://device-management-IP:8080/public/v1/config/BGPv4PeerGroups?CurrentMarker=<x>&Count=<y>
	- CREATE(POST)
		 curl -X POST -H 'Content-Type: application/json' --header 'Accept: application/json' -d '{<Model Object as json-Data>}' http://device-management-IP:8080/public/v1/config/BGPv4PeerGroup
	- DELETE By Key
		 curl -X DELETE -i -H 'Accept:application/json' -d '{<Model Object as json data>}' http://device-management-IP:8080/public/v1/config/BGPv4PeerGroup
	- DELETE By ID
		 curl -X DELETE http://device-management-IP:8080/public/v1/config/BGPv4PeerGroup<uuid>
	- UPDATE(PATCH) By Key
		 curl -X PATCH -H 'Content-Type: application/json' -d '{<Model Object as json data>}'  http://device-management-IP:8080/public/v1/config/BGPv4PeerGroup
	- UPDATE(PATCH) By ID
		 curl -X PATCH -H 'Content-Type: application/json' -d '{<Model Object as json data>}'  http://device-management-IP:8080/public/v1/config/BGPv4PeerGroup<uuid>


*OpxFlexSwitch SDK API Supported:*
------------------------------------



- **GET**


::

	import sys
	import os
	from flexswitchV2 import OpxFlexSwitch

	if __name__ == '__main__':
		switchIP := "192.168.56.101"
		swtch = OpxFlexSwitch (switchIP, 8080)  # Instantiate object to talk to flexSwitch
		response, error = swtch.getBGPv4PeerGroup(Name=name)

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'


- **GET By ID**


::

	import sys
	import os
	from flexswitchV2 import OpxFlexSwitch

	if __name__ == '__main__':
		switchIP := "192.168.56.101"
		swtch = OpxFlexSwitch (switchIP, 8080)  # Instantiate object to talk to flexSwitch
		response, error = swtch.getBGPv4PeerGroupById(ObjectId=objectid)

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'




- **GET ALL**


::

	import sys
	import os
	from flexswitchV2 import OpxFlexSwitch

	if __name__ == '__main__':
		switchIP := "192.168.56.101"
		swtch = OpxFlexSwitch (switchIP, 8080)  # Instantiate object to talk to flexSwitch
		response, error = swtch.getAllBGPv4PeerGroups()

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'


- **CREATE**

::

	import sys
	import os
	from flexswitchV2 import OpxFlexSwitch

	if __name__ == '__main__':
		switchIP := "192.168.56.101"
		swtch = OpxFlexSwitch (switchIP, 8080)  # Instantiate object to talk to flexSwitch
		response, error = swtch.createBGPv4PeerGroup(Name=name, AddPathsRx=addpathsrx, RouteReflectorClient=routereflectorclient, UpdateSource=updatesource, MultiHopEnable=multihopenable, PeerAS=peeras, MaxPrefixes=maxprefixes, MaxPrefixesDisconnect=maxprefixesdisconnect, MaxPrefixesRestartTimer=maxprefixesrestarttimer, MaxPrefixesThresholdPct=maxprefixesthresholdpct, AdjRIBOutFilter=adjriboutfilter, ConnectRetryTime=connectretrytime, NextHopSelf=nexthopself, HoldTime=holdtime, KeepaliveTime=keepalivetime, LocalAS=localas, MultiHopTTL=multihopttl, AddPathsMaxTx=addpathsmaxtx, AdjRIBInFilter=adjribinfilter, AuthPassword=authpassword, Description=description, RouteReflectorClusterId=routereflectorclusterid)

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'


- **DELETE**

::

	import sys
	import os
	from flexswitchV2 import OpxFlexSwitch

	if __name__ == '__main__':
		switchIP := "192.168.56.101"
		swtch = OpxFlexSwitch (switchIP, 8080)  # Instantiate object to talk to flexSwitch
		response, error = swtch.deleteBGPv4PeerGroup(Name=name)

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'


- **DELETE By ID**

::

	import sys
	import os
	from flexswitchV2 import OpxFlexSwitch

	if __name__ == '__main__':
		switchIP := "192.168.56.101"
		swtch = OpxFlexSwitch (switchIP, 8080)  # Instantiate object to talk to flexSwitch
		response, error = swtch.deleteBGPv4PeerGroupById(ObjectId=objectid

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'


- **UPDATE**

::

	import sys
	import os
	from flexswitchV2 import OpxFlexSwitch

	if __name__ == '__main__':
		switchIP := "192.168.56.101"
		swtch = OpxFlexSwitch (switchIP, 8080)  # Instantiate object to talk to flexSwitch
		response, error = swtch.updateBGPv4PeerGroup(Name=name, AddPathsRx=addpathsrx, RouteReflectorClient=routereflectorclient, UpdateSource=updatesource, MultiHopEnable=multihopenable, PeerAS=peeras, MaxPrefixes=maxprefixes, MaxPrefixesDisconnect=maxprefixesdisconnect, MaxPrefixesRestartTimer=maxprefixesrestarttimer, MaxPrefixesThresholdPct=maxprefixesthresholdpct, AdjRIBOutFilter=adjriboutfilter, ConnectRetryTime=connectretrytime, NextHopSelf=nexthopself, HoldTime=holdtime, KeepaliveTime=keepalivetime, LocalAS=localas, MultiHopTTL=multihopttl, AddPathsMaxTx=addpathsmaxtx, AdjRIBInFilter=adjribinfilter, AuthPassword=authpassword, Description=description, RouteReflectorClusterId=routereflectorclusterid)

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'


- **UPDATE By ID**

::

	import sys
	import os
	from flexswitchV2 import OpxFlexSwitch

	if __name__ == '__main__':
		switchIP := "192.168.56.101"
		swtch = OpxFlexSwitch (switchIP, 8080)  # Instantiate object to talk to flexSwitch
		response, error = swtch.updateBGPv4PeerGroupById(ObjectId=objectidAddPathsRx=addpathsrx, RouteReflectorClient=routereflectorclient, UpdateSource=updatesource, MultiHopEnable=multihopenable, PeerAS=peeras, MaxPrefixes=maxprefixes, MaxPrefixesDisconnect=maxprefixesdisconnect, MaxPrefixesRestartTimer=maxprefixesrestarttimer, MaxPrefixesThresholdPct=maxprefixesthresholdpct, AdjRIBOutFilter=adjriboutfilter, ConnectRetryTime=connectretrytime, NextHopSelf=nexthopself, HoldTime=holdtime, KeepaliveTime=keepalivetime, LocalAS=localas, MultiHopTTL=multihopttl, AddPathsMaxTx=addpathsmaxtx, AdjRIBInFilter=adjribinfilter, AuthPassword=authpassword, Description=description, RouteReflectorClusterId=routereflectorclusterid)

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'
