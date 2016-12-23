PortState Object
=============================================================

*state/Port*
------------------------------------

- Multiple objects of this type can exist in a system.

+-----------------------------+---------------+--------------------------------+-------------+------------------+
|     **PARAMETER NAME**      | **DATA TYPE** |        **DESCRIPTION**         | **DEFAULT** | **VALID VALUES** |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IntfRef **[KEY]**           | string        | Front panel port name or       | N/A         | N/A              |
|                             |               | system assigned interface id   |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfEtherPkts256To511Octets   | int64         | RFC 1757 Total number of       | N/A         | N/A              |
|                             |               | ethernet packets sized between |             |                  |
|                             |               | 256 and 511 bytes              |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfEtherPkts512To1023Octets  | int64         | RFC 1757 Total number of       | N/A         | N/A              |
|                             |               | ethernet packets sized between |             |                  |
|                             |               | 512 and 1023 bytes             |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfEtherBcastPkts            | int64         | RFC 1757 Total number of       | N/A         | N/A              |
|                             |               | ethernet broadcast packets     |             |                  |
|                             |               | received and transmitted       |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfEtherPkts65To127Octets    | int64         | RFC 1757 Total number of       | N/A         | N/A              |
|                             |               | ethernet packets sized between |             |                  |
|                             |               | 65 and 127 bytes               |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfOutErrors                 | int64         | RFC2233 Total number of        | N/A         | N/A              |
|                             |               | packets discarded and not      |             |                  |
|                             |               | transmitted due to packet      |             |                  |
|                             |               | errors                         |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| LastDownEventTime           | string        | Timestamp corresponding to the | N/A         | N/A              |
|                             |               | last UP to DOWN operational    |             |                  |
|                             |               | state change event             |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| OperState                   | string        | Operational state of front     | N/A         | N/A              |
|                             |               | panel port                     |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfEtherJabber               | int64         | RFC 1757 Total number of       | N/A         | N/A              |
|                             |               | jabber frames received and     |             |                  |
|                             |               | transmitted                    |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfEtherPkts                 | int64         | RFC 1757 Total number of       | N/A         | N/A              |
|                             |               | ethernet packets received and  |             |                  |
|                             |               | transmitted                    |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfEtherUnderSizePktCnt      | int64         | RFC 1757 Total numbe of        | N/A         | N/A              |
|                             |               | undersized packets received    |             |                  |
|                             |               | and transmitted                |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfInDiscards                | int64         | RFC2233 Total number of        | N/A         | N/A              |
|                             |               | inbound packets that were      |             |                  |
|                             |               | discarded                      |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfIndex                     | int32         | System assigned interface id   | N/A         | N/A              |
|                             |               | for this port                  |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfOutUcastPkts              | int64         | RFC2233 Total number of        | N/A         | N/A              |
|                             |               | unicast packets transmitted on |             |                  |
|                             |               | this port                      |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfEtherMCPkts               | int64         | RFC 1757 Total number of       | N/A         | N/A              |
|                             |               | multicast packets received and |             |                  |
|                             |               | transmitted                    |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfEtherOverSizePktCnt       | int64         | RFC 1757 Total number of       | N/A         | N/A              |
|                             |               | oversized packets received and |             |                  |
|                             |               | transmitted                    |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfInUcastPkts               | int64         | RFC2233 Total number of        | N/A         | N/A              |
|                             |               | unicast packets received on    |             |                  |
|                             |               | this port                      |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| LastUpEventTime             | string        | Timestamp corresponding to the | N/A         | N/A              |
|                             |               | last DOWN to UP operational    |             |                  |
|                             |               | state change event             |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| Name                        | string        | System assigned vlan name      | N/A         | N/A              |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| ConfigMode                  | string        | The current mode of            | N/A         | N/A              |
|                             |               | configuration on this port     |             |                  |
|                             |               | (L2/L3/Internal)               |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfEtherPkts1024To1518Octets | int64         | RFC 1757 Total number of       | N/A         | N/A              |
|                             |               | ethernet packets sized between |             |                  |
|                             |               | 1024 and 1518 bytes            |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfEtherPkts128To255Octets   | int64         | RFC 1757 Total number of       | N/A         | N/A              |
|                             |               | ethernet packets sized between |             |                  |
|                             |               | 128 and 255 bytes              |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfEtherPkts64OrLessOctets   | int64         | RFC1757 Total number of        | N/A         | N/A              |
|                             |               | ethernet packets sized 64      |             |                  |
|                             |               | bytes or lesser                |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfInErrors                  | int64         | RFC2233 Total number of        | N/A         | N/A              |
|                             |               | inbound packets that contained |             |                  |
|                             |               | an error                       |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| PresentInHW                 | string        | Indication of whether this     | N/A         | N/A              |
|                             |               | port object maps to a physical |             |                  |
|                             |               | port. Set to 'No' for ports    |             |                  |
|                             |               | that are not broken out.       |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfEtherCRCAlignError        | int64         | RFC 1757 Total number of CRC   | N/A         | N/A              |
|                             |               | alignment errors               |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfOutOctets                 | int64         | RFC2233 Total number of octets | N/A         | N/A              |
|                             |               | transmitted on this port       |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| NumDownEvents               | int32         | Number of times the            | N/A         | N/A              |
|                             |               | operational state transitioned |             |                  |
|                             |               | from UP to DOWN                |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| NumUpEvents                 | int32         | Number of times the            | N/A         | N/A              |
|                             |               | operational state transitioned |             |                  |
|                             |               | from DOWN to UP                |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| PRBSRxErrCnt                | int64         | Receive error count reported   | N/A         | N/A              |
|                             |               | by PRBS checker                |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfInUnknownProtos           | int64         | RFC2233 Total number of        | N/A         | N/A              |
|                             |               | inbound packets discarded due  |             |                  |
|                             |               | to unknown protocol            |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfEtherFragments            | int64         | RFC1757 Total number of        | N/A         | N/A              |
|                             |               | ethernet fragments received    |             |                  |
|                             |               | and transmitted                |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfInOctets                  | int64         | RFC2233 Total number of octets | N/A         | N/A              |
|                             |               | received on this port          |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| IfOutDiscards               | int64         | RFC2233 Total number of error  | N/A         | N/A              |
|                             |               | free packets discarded and not |             |                  |
|                             |               | transmitted                    |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| ErrDisableReason            | string        | Reason explaining why port has | N/A         | N/A              |
|                             |               | been disabled by protocol code |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+
| Pvid                        | int32         | The vlanid assigned to         | N/A         | N/A              |
|                             |               | untagged traffic ingressing    |             |                  |
|                             |               | this port                      |             |                  |
+-----------------------------+---------------+--------------------------------+-------------+------------------+



*OpxFlexSwitch CURL API Supported*
------------------------------------

	- GET By Key
		 curl -X GET -H 'Content-Type: application/json' --header 'Accept: application/json' -d '{<Model Object as json-Data>}' http://device-management-IP:8080/public/v1/state/Port
	- GET ALL
		 curl -X GET http://device-management-IP:8080/public/v1/state/Ports?CurrentMarker=<x>&Count=<y>
	- GET By ID
		 curl -X GET http://device-management-IP:8080/public/v1/config/PortState/<uuid>


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
		response, error = swtch.getPortState(IntfRef=intfref)

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
		response, error = swtch.getPortStateById(ObjectId=objectid)

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
		response, error = swtch.getAllPortStates()

		if error != None: #Error not being None implies there is some problem
			print error
		else :
			print 'Success'


