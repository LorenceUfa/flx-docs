NotifierEnable Object
=============================================================

*config/NotifierEnable*
------------------------------------

- Only one object of this type can exist in a system.

+--------------------+---------------+-----------------+-------------+------------------+
| **PARAMETER NAME** | **DATA TYPE** | **DESCRIPTION** | **DEFAULT** | **VALID VALUES** |
+--------------------+---------------+-----------------+-------------+------------------+
| Vrf **[KEY]**      | string        | Vrf name        | default     | N/A              |
+--------------------+---------------+-----------------+-------------+------------------+
| AlarmEnable        | bool          | Enable Notifier | true        | N/A              |
+--------------------+---------------+-----------------+-------------+------------------+
| EventEnable        | bool          | Enable Notifier | true        | N/A              |
+--------------------+---------------+-----------------+-------------+------------------+
| FaultEnable        | bool          | Enable Notifier | true        | N/A              |
+--------------------+---------------+-----------------+-------------+------------------+



*OpxFlexSwitch CURL API Supported*
------------------------------------

	- GET By Key
		 curl -X GET -H 'Content-Type: application/json' --header 'Accept: application/json' -d '{<Model Object as json-Data>}' http://device-management-IP:8080/public/v1/config/NotifierEnable
	- GET By ID
		 curl -X GET http://device-management-IP:8080/public/v1/config/NotifierEnable/<uuid>
	- UPDATE(PATCH) By Key
		 curl -X PATCH -H 'Content-Type: application/json' -d '{<Model Object as json data>}'  http://device-management-IP:8080/public/v1/config/NotifierEnable
	- UPDATE(PATCH) By ID
		 curl -X PATCH -H 'Content-Type: application/json' -d '{<Model Object as json data>}'  http://device-management-IP:8080/public/v1/config/NotifierEnable<uuid>


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
		response, error = swtch.getNotifierEnable(Vrf=vrf)

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
		response, error = swtch.getNotifierEnableById(ObjectId=objectid)

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
		response, error = swtch.getAllNotifierEnables()

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
		response, error = swtch.updateNotifierEnable(Vrf=vrf, AlarmEnable=alarmenable, EventEnable=eventenable, FaultEnable=faultenable)

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
		response, error = swtch.updateNotifierEnableById(ObjectId=objectidAlarmEnable=alarmenable, EventEnable=eventenable, FaultEnable=faultenable)

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'
