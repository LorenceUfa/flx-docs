QsfpPMDataState Object
=============================================================

*state/QsfpPMData*
------------------------------------

- Multiple objects of this type can exist in a system.

+--------------------+---------------+-----------------------+-------------+---------------------------+
| **PARAMETER NAME** | **DATA TYPE** |    **DESCRIPTION**    | **DEFAULT** |     **VALID VALUES**      |
+--------------------+---------------+-----------------------+-------------+---------------------------+
| Class **[KEY]**    | string        | Class of PM Data      | CLASS-A     | CLASS-A, CLASS-B, CLASS-B |
+--------------------+---------------+-----------------------+-------------+---------------------------+
| QsfpId **[KEY]**   | int32         | QSFP Id               | N/A         | N/A                       |
+--------------------+---------------+-----------------------+-------------+---------------------------+
| Resource **[KEY]** | string        | QSFP PM Resource Name | N/A         | N/A                       |
+--------------------+---------------+-----------------------+-------------+---------------------------+
| Data               | QsfpPMData    |                       | N/A         | N/A                       |
+--------------------+---------------+-----------------------+-------------+---------------------------+



*OpxFlexSwitch CURL API Supported*
------------------------------------

	- GET By Key
		 curl -X GET -H 'Content-Type: application/json' --header 'Accept: application/json' -d '{<Model Object as json-Data>}' http://device-management-IP:8080/public/v1/state/QsfpPMData
	- GET ALL
		 curl -X GET http://device-management-IP:8080/public/v1/state/QsfpPMDatas?CurrentMarker=<x>&Count=<y>
	- GET By ID
		 curl -X GET http://device-management-IP:8080/public/v1/config/QsfpPMDataState/<uuid>


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
		response, error = swtch.getQsfpPMDataState(Class=class, QsfpId=qsfpid, Resource=resource)

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
		response, error = swtch.getQsfpPMDataStateById(ObjectId=objectid)

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
		response, error = swtch.getAllQsfpPMDataStates()

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'


