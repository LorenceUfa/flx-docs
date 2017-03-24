#!/bin/bash
#======================================================================================================================
#Mgmt IP: 192.168.100.187
#======================================================================================================================
echo "==============================================================================================================="
echo "Configuring Switch 1 (Mgmt IP: 192.168.100.187) ..."
echo "==============================================================================================================="
echo "Setting Port: e101-001-0, AdminState: UP"
curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "e101-001-0", "AdminState":"UP"}'  http://192.168.100.187:8080/public/v1/config/Port > /dev/null 2>&1
sleep 1
echo "Setting Port: e101-002-0, AdminState: UP"
curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "e101-002-0", "AdminState":"UP"}'  http://192.168.100.187:8080/public/v1/config/Port > /dev/null 2>&1
sleep 1
echo "Creating Vlan: 10, Untagged Interface List: [e101-001-0]"
curl -H "Content-Type: application/json" -d '{"VlanId":10, "UntagIntfList":["e101-001-0"]}' http://192.168.100.187:8080/public/v1/config/Vlan > /dev/null 2>&1
echo "Creating Vlan: 20, Untagged Interface List: [e101-002-0]"
curl -H "Content-Type: application/json" -d '{"VlanId":20, "UntagIntfList":["e101-002-0"]}' http://192.168.100.187:8080/public/v1/config/Vlan > /dev/null 2>&1
echo "Assigning IPv4 Address 31.1.10.1/24 on br10"
curl -H "Content-Type: application/json" -d '{"IpAddr": "31.1.10.1/24", "IntfRef":"br10"}' http://192.168.100.187:8080/public/v1/config/IPv4Intf > /dev/null 2>&1
echo "Assigning IPv4 Address 41.1.10.1/24 on br20"
curl -H "Content-Type: application/json" -d '{"IpAddr": "41.1.10.1/24", "IntfRef":"br20"}' http://192.168.100.187:8080/public/v1/config/IPv4Intf > /dev/null 2>&1

echo "Creating BGP Global Instance LocalAS: 100, RouterId: 192.168.100.187"
curl -H "Content-Type: application/json" -d '{"Vrf":"default", "ASNum":"100", "RouterId":"192.168.100.187"}' -X PATCH http://192.168.100.187:8080/public/v1/config/bgpglobal > /dev/null 2>&1
echo "Configuring BGPv4 Neighbor Address: 31.1.10.2, PeerAS: 300, LocalAS: 100, ConnectRetyTime: 30s, HoldTime: 3s, KeepaliveTime: 1s"
curl -H "Content-Type: application/json" -d '{"NeighborAddress":"31.1.10.2", "IntfRef":"", "PeerAS":"300", "LocalAS":"100", "ConnectRetryTime":30, "HoldTime":3, "KeepaliveTime":1}' -X POST http://192.168.100.187:8080/public/v1/config/bgpv4neighbor > /dev/null 2>&1
echo "Configuring BGPv4 Neighbor Address: 41.1.10.2, PeerAS: 400, LocalAS: 100, ConnectRetyTime: 30s, HoldTime: 3s, KeepaliveTime: 1s"
curl -H "Content-Type: application/json" -d '{"NeighborAddress":"41.1.10.2", "IntfRef":"", "PeerAS":"400", "LocalAS":"100", "ConnectRetryTime":30, "HoldTime":3, "KeepaliveTime":1}' -X POST http://192.168.100.187:8080/public/v1/config/bgpv4neighbor > /dev/null 2>&1
sleep 2
echo "==============================================================================================================="

#======================================================================================================================
#Mgmt IP: 192.168.100.19
#======================================================================================================================

echo "==============================================================================================================="
echo "Configuring Switch 2 (Mgmt IP: 192.168.100.19) ..."
echo "==============================================================================================================="
echo "Setting Port: e101-001-0, AdminState: UP"
curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "e101-001-0", "AdminState":"UP"}'  http://192.168.100.19:8080/public/v1/config/Port > /dev/null 2>&1
sleep 1
echo "Setting Port: e101-002-0, AdminState: UP"
curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "e101-002-0", "AdminState":"UP"}'  http://192.168.100.19:8080/public/v1/config/Port > /dev/null 2>&1
sleep 1
echo "Creating Vlan: 10, Untagged Interface List: [e101-001-0]"
curl -H "Content-Type: application/json" -d '{"VlanId":10, "UntagIntfList":["e101-001-0"]}' http://192.168.100.19:8080/public/v1/config/Vlan > /dev/null 2>&1
echo "Creating Vlan: 20, Untagged Interface List: [e101-002-0]"
curl -H "Content-Type: application/json" -d '{"VlanId":20, "UntagIntfList":["e101-002-0"]}' http://192.168.100.19:8080/public/v1/config/Vlan > /dev/null 2>&1
echo "Assigning IPv4 Address 51.1.10.1/24 on br10"
curl -H "Content-Type: application/json" -d '{"IpAddr": "51.1.10.1/24", "IntfRef":"br10"}' http://192.168.100.19:8080/public/v1/config/IPv4Intf > /dev/null 2>&1
echo "Assigning IPv4 Address 61.1.10.1/24 on br20"
curl -H "Content-Type: application/json" -d '{"IpAddr": "61.1.10.1/24", "IntfRef":"br20"}' http://192.168.100.19:8080/public/v1/config/IPv4Intf > /dev/null 2>&1

echo "Creating BGP Global Instance LocalAS: 200, RouterId: 192.168.100.19"
curl -H "Content-Type: application/json" -d '{"Vrf":"default", "ASNum":"200", "RouterId":"192.168.100.19"}' -X PATCH http://192.168.100.19:8080/public/v1/config/bgpglobal > /dev/null 2>&1
echo "Configuring BGPv4 Neighbor Address: 51.1.10.2, PeerAS: 300, LocalAS: 200, ConnectRetyTime: 30s, HoldTime: 3s, KeepaliveTime: 1s"
curl -H "Content-Type: application/json" -d '{"NeighborAddress":"51.1.10.2", "IntfRef":"", "PeerAS":"300", "LocalAS":"200", "ConnectRetryTime":30, "HoldTime":3, "KeepaliveTime":1}' -X POST http://192.168.100.19:8080/public/v1/config/bgpv4neighbor > /dev/null 2>&1
echo "Configuring BGPv4 Neighbor Address: 61.1.10.2, PeerAS: 400, LocalAS: 200, ConnectRetyTime: 30s, HoldTime: 3s, KeepaliveTime: 1s"
curl -H "Content-Type: application/json" -d '{"NeighborAddress":"61.1.10.2", "IntfRef":"", "PeerAS":"400", "LocalAS":"200", "ConnectRetryTime":30, "HoldTime":3, "KeepaliveTime":1}' -X POST http://192.168.100.19:8080/public/v1/config/bgpv4neighbor > /dev/null 2>&1
sleep 2
echo "==============================================================================================================="

#======================================================================================================================
#Mgmt IP: 192.168.100.165
#======================================================================================================================

echo "==============================================================================================================="
echo "Configuring Switch 3 (Mgmt IP: 192.168.100.165) ..."
echo "==============================================================================================================="
echo "Setting Port: fpPort49 AdminState: UP, Speed: 40000"
curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "fpPort49", "AdminState":"UP", "Speed":40000, "Autoneg":"OFF"}'  http://192.168.100.165:8080/public/v1/config/Port > /dev/null 2>&1
sleep 1
echo "Setting Port: fpPort50 AdminState: UP, Speed: 40000"
curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "fpPort50", "AdminState":"UP", "Speed":40000, "Autoneg":"OFF"}'  http://192.168.100.165:8080/public/v1/config/Port > /dev/null 2>&1
sleep 1
echo "Setting Port: fpPort1 AdminState: UP, Speed: 1000"
curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "fpPort1", "AdminState":"UP", "Speed":1000, "Autoneg":"OFF"}'  http://192.168.100.165:8080/public/v1/config/Port > /dev/null 2>&1
echo "Assigning IPv4 Address 31.1.10.2/24 on fpPort49"
curl -H "Content-Type: application/json" -d '{"IpAddr": "31.1.10.2/24", "IntfRef":"fpPort49"}' http://192.168.100.165:8080/public/v1/config/IPv4Intf > /dev/null 2>&1
echo "Assigning IPv4 Address 51.1.10.2/24 on fpPort50"
curl -H "Content-Type: application/json" -d '{"IpAddr": "51.1.10.2/24", "IntfRef":"fpPort50"}' http://192.168.100.165:8080/public/v1/config/IPv4Intf > /dev/null 2>&1
echo "Assigning IPv4 Address 11.1.10.1/24 on fpPort1"
curl -H "Content-Type: application/json" -d '{"IpAddr": "11.1.10.1/24", "IntfRef":"fpPort1"}' http://192.168.100.165:8080/public/v1/config/IPv4Intf > /dev/null 2>&1

echo "Creating Policy Condition Name: MatchConnected, ConditionType: MatchProtocol, Protocol: CONNECTED"
curl -H "Content-Type: application/json" -d '{"Name":"MatchConnected", "ConditionType":"MatchProtocol", "Protocol":"CONNECTED"}' http://192.168.100.165:8080/public/v1/config/PolicyCondition > /dev/null 2>&1

echo "Creating Policy Condition Name: RdistributeConnectedBGP, MatchCondition: all, Conditions: [MatchConnected], Action: permit"
curl -H "Content-Type: application/json" -d '{"Name":"RedistributeConnectedBGP", "MatchConditions":"all", "Conditions":["MatchConnected"], "Action":"permit"}' http://192.168.100.165:8080/public/v1/config/PolicyStmt > /dev/null 2>&1

echo "Creating Policy Defination Name: ImportPolicy, Priority: 1, MatchType: all, StatementList:[RedistributeConnectedBGP]"
curl -H "Content-Type: application/json" -d '{"Name":"ImportPolicy", "Priority":1, "MatchType":"all", "StatementList":[{"Priority":1,"Statement":"RedistributeConnectedBGP"}]}' http://192.168.100.165:8080/public/v1/config/PolicyDefinition > /dev/null 2>&1

echo "Creating BGP Global Instance LocalAS: 300, RouterId: 192.168.100.165"
curl -H "Content-Type: application/json" -d '{"Vrf":"default", "ASNum":"300", "RouterId":"192.168.100.165", "Redistribution":[{"Sources":"CONNECTED","Policy":"ImportPolicy"}]}' -X PATCH http://192.168.100.165:8080/public/v1/config/bgpglobal > /dev/null 2>&1

echo "Configuring BGPv4 Neighbor Address: 31.1.10.1, PeerAS: 100, LocalAS: 300, ConnectRetyTime: 30s, HoldTime: 3s, KeepaliveTime: 1s"
curl -H "Content-Type: application/json" -d '{"NeighborAddress":"31.1.10.1", "IntfRef":"", "PeerAS":"100", "LocalAS":"300", "ConnectRetryTime":30, "HoldTime":3, "KeepaliveTime":1}' -X POST http://192.168.100.165:8080/public/v1/config/bgpv4neighbor > /dev/null 2>&1
echo "Configuring BGPv4 Neighbor Address: 51.1.10.1, PeerAS: 200, LocalAS: 300, ConnectRetyTime: 30s, HoldTime: 3s, KeepaliveTime: 1s"
curl -H "Content-Type: application/json" -d '{"NeighborAddress":"51.1.10.1", "IntfRef":"", "PeerAS":"200", "LocalAS":"300", "ConnectRetryTime":30, "HoldTime":3, "KeepaliveTime":1}' -X POST http://192.168.100.165:8080/public/v1/config/bgpv4neighbor > /dev/null 2>&1

sleep 2
echo "==============================================================================================================="

#======================================================================================================================
#Mgmt IP: 192.168.100.242
#======================================================================================================================

echo "==============================================================================================================="
echo "Configuring Switch 4 (Mgmt IP: 192.168.100.242) ..."
echo "==============================================================================================================="
echo "Setting Port: fpPort49 AdminState: UP, Speed: 40000"
curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "fpPort49", "AdminState":"UP", "Speed":40000, "Autoneg":"OFF"}'  http://192.168.100.242:8080/public/v1/config/Port > /dev/null 2>&1
sleep 1
echo "Setting Port: fpPort50 AdminState: UP, Speed: 40000"
curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "fpPort50", "AdminState":"UP", "Speed":40000, "Autoneg":"OFF"}'  http://192.168.100.242:8080/public/v1/config/Port > /dev/null 2>&1
sleep 1
echo "Setting Port: fpPort1 AdminState: UP, Speed: 1000"
curl -X PATCH -H "Content-Type: application/json" -d '{"IntfRef": "fpPort1", "AdminState":"UP", "Speed":1000, "Autoneg":"OFF"}'  http://192.168.100.242:8080/public/v1/config/Port > /dev/null 2>&1
sleep 1
echo "Assigning IPv4 Address 41.1.10.2/24 on fpPort49"
curl -H "Content-Type: application/json" -d '{"IpAddr": "41.1.10.2/24", "IntfRef":"fpPort49"}' http://192.168.100.242:8080/public/v1/config/IPv4Intf > /dev/null 2>&1
echo "Assigning IPv4 Address 61.1.10.2/24 on fpPort50"
curl -H "Content-Type: application/json" -d '{"IpAddr": "61.1.10.2/24", "IntfRef":"fpPort50"}' http://192.168.100.242:8080/public/v1/config/IPv4Intf > /dev/null 2>&1
echo "Assigning IPv4 Address 21.1.10.1/24 on fpPort1"
curl -H "Content-Type: application/json" -d '{"IpAddr": "21.1.10.1/24", "IntfRef":"fpPort1"}' http://192.168.100.242:8080/public/v1/config/IPv4Intf > /dev/null 2>&1
echo "Creating Policy Condition Name: MatchConnected, ConditionType: MatchProtocol, Protocol: CONNECTED"
curl -H "Content-Type: application/json" -d '{"Name":"MatchConnected", "ConditionType":"MatchProtocol", "Protocol":"CONNECTED"}' http://192.168.100.242:8080/public/v1/config/PolicyCondition > /dev/null 2>&1
echo "Creating Policy Condition Name: RdistributeConnectedBGP, MatchCondition: all, Conditions: [MatchConnected], Action: permit"
curl -H "Content-Type: application/json" -d '{"Name":"RedistributeConnectedBGP", "MatchConditions":"all", "Conditions":["MatchConnected"], "Action":"permit"}' http://192.168.100.242:8080/public/v1/config/PolicyStmt > /dev/null 2>&1
echo "Creating Policy Defination Name: ImportPolicy, Priority: 1, MatchType: all, StatementList:[RedistributeConnectedBGP]"
curl -H "Content-Type: application/json" -d '{"Name":"ImportPolicy", "Priority":1, "MatchType":"all", "StatementList":[{"Priority":1,"Statement":"RedistributeConnectedBGP"}]}' http://192.168.100.242:8080/public/v1/config/PolicyDefinition > /dev/null 2>&1
echo "Creating BGP Global Instance LocalAS: 400, RouterId: 192.168.100.242"
curl -H "Content-Type: application/json" -d '{"Vrf":"default", "ASNum":"400", "RouterId":"192.168.100.242", "Redistribution":[{"Sources":"CONNECTED","Policy":"ImportPolicy"}]}' -X PATCH http://192.168.100.242:8080/public/v1/config/bgpglobal > /dev/null 2>&1
echo "Configuring BGPv4 Neighbor Address: 41.1.10.1, PeerAS: 100, LocalAS: 400, ConnectRetyTime: 30s, HoldTime: 3s, KeepaliveTime: 1s"
curl -H "Content-Type: application/json" -d '{"NeighborAddress":"41.1.10.1", "IntfRef":"", "PeerAS":"100", "LocalAS":"400", "ConnectRetryTime":30, "HoldTime":3, "KeepaliveTime":1}' -X POST http://192.168.100.242:8080/public/v1/config/bgpv4neighbor > /dev/null 2>&1
echo "Configuring BGPv4 Neighbor Address: 61.1.10.1, PeerAS: 200, LocalAS: 400, ConnectRetyTime: 30s, HoldTime: 3s, KeepaliveTime: 1s"
curl -H "Content-Type: application/json" -d '{"NeighborAddress":"61.1.10.1", "IntfRef":"", "PeerAS":"200", "LocalAS":"400", "ConnectRetryTime":30, "HoldTime":3, "KeepaliveTime":1}' -X POST http://192.168.100.242:8080/public/v1/config/bgpv4neighbor > /dev/null 2>&1
echo "==============================================================================================================="
echo "Done"
echo "==============================================================================================================="
