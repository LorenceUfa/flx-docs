FaultState Object
=============================================================

*state/Fault*
------------------------------------

- Multiple objects of this type can exist in a system.

+----------------------+---------------+--------------------------------+-------------+------------------+
|  **PARAMETER NAME**  | **DATA TYPE** |        **DESCRIPTION**         | **DEFAULT** | **VALID VALUES** |
+----------------------+---------------+--------------------------------+-------------+------------------+
| EventId **[KEY]**    | int32         | Fault event id picked up from  | N/A         | N/A              |
|                      |               | events.json                    |             |                  |
+----------------------+---------------+--------------------------------+-------------+------------------+
| OwnerName **[KEY]**  | string        | Fault owner daemon name picked | N/A         | N/A              |
|                      |               | up from events.json            |             |                  |
+----------------------+---------------+--------------------------------+-------------+------------------+
| EventName **[KEY]**  | string        | Fault event name picked up     | N/A         | N/A              |
|                      |               | from events.json               |             |                  |
+----------------------+---------------+--------------------------------+-------------+------------------+
| OwnerId **[KEY]**    | int32         | Fault owner daemon Id picked   | N/A         | N/A              |
|                      |               | up from events.json            |             |                  |
+----------------------+---------------+--------------------------------+-------------+------------------+
| SrcObjName **[KEY]** | string        | Fault event name picked up     | N/A         | N/A              |
|                      |               | from events.json               |             |                  |
+----------------------+---------------+--------------------------------+-------------+------------------+
| Description          | string        | Description explaining the     | N/A         | N/A              |
|                      |               | fault                          |             |                  |
+----------------------+---------------+--------------------------------+-------------+------------------+
| ResolutionTime       | string        | Resolution Time stamp          | N/A         | N/A              |
+----------------------+---------------+--------------------------------+-------------+------------------+
| SrcObjKey            | string        | Fault Object Key               | N/A         | N/A              |
+----------------------+---------------+--------------------------------+-------------+------------------+
| SrcObjUUID           | string        | Fault Object UUID              | N/A         | N/A              |
+----------------------+---------------+--------------------------------+-------------+------------------+
| OccuranceTime        | string        | Timestamp at which fault       | N/A         | N/A              |
|                      |               | occured                        |             |                  |
+----------------------+---------------+--------------------------------+-------------+------------------+
| ResolutionReason     | string        | Cleared/Disabled               | N/A         | N/A              |
+----------------------+---------------+--------------------------------+-------------+------------------+



*OpxFlexSwitch CURL API Supported*
------------------------------------

	- GET By Key
		 curl -X GET -H 'Content-Type: application/json' --header 'Accept: application/json' -d '{<Model Object as json-Data>}' http://device-management-IP:8080/public/v1/state/Fault
	- GET ALL
		 curl -X GET http://device-management-IP:8080/public/v1/state/Faults?CurrentMarker=<x>&Count=<y>
	- GET By ID
		 curl -X GET http://device-management-IP:8080/public/v1/config/FaultState/<uuid>


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
		response, error = swtch.getFaultState(EventId=eventid, OwnerName=ownername, EventName=eventname, OwnerId=ownerid, SrcObjName=srcobjname)

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
		response, error = swtch.getFaultStateById(ObjectId=objectid)

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
		response, error = swtch.getAllFaultStates()

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'


