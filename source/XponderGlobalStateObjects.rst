XponderGlobalState Object
=============================================================

*state/XponderGlobal*
------------------------------------

- Only one object of this type can exist in a system.

+---------------------+---------------+--------------------------------+-------------+------------------+
| **PARAMETER NAME**  | **DATA TYPE** |        **DESCRIPTION**         | **DEFAULT** | **VALID VALUES** |
+---------------------+---------------+--------------------------------+-------------+------------------+
| XponderId **[KEY]** | uint8         | Xponder module identifier      | N/A         | N/A              |
+---------------------+---------------+--------------------------------+-------------+------------------+
| XponderDescription  | string        | User configurable description  | N/A         | N/A              |
|                     |               | string for the xponder module  |             |                  |
+---------------------+---------------+--------------------------------+-------------+------------------+
| XponderMode         | string        | Global operational mode of     | N/A         | N/A              |
|                     |               | Xponder module                 |             |                  |
+---------------------+---------------+--------------------------------+-------------+------------------+



*OpxFlexSwitch CURL API Supported*
------------------------------------

	- GET By Key
		 curl -X GET -H 'Content-Type: application/json' --header 'Accept: application/json' -d '{<Model Object as json-Data>}' http://device-management-IP:8080/public/v1/state/XponderGlobal
	- GET By ID
		 curl -X GET http://device-management-IP:8080/public/v1/config/XponderGlobalState/<uuid>


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
		response, error = swtch.getXponderGlobalState(XponderId=xponderid)

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
		response, error = swtch.getXponderGlobalStateById(ObjectId=objectid)

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
		response, error = swtch.getAllXponderGlobalStates()

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'


