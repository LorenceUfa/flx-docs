RIB
===================

This is a implementation of Routing Information Base (RIB) in Go.
Summary of functionality implemented by this module is as follows:

1. Handle all network route based configuration (route create, route delete, route update) from either users or other applications (e.g., BGP, OSPF)

2. Handle all routing policy based configuration :
   a. policy conditions create/delete/updates
   b. policy statements create/delete/updates
   c. policy definitions create/delete/updates

3. Implement policy engine 
   a. Based on the policy objects configured and applied on the device, the policy engine filter will match on the conditions provisioned and implement actions based on the application location. For instance, the policy engine filter may result in redistributing certain (route type based/ network prefix based) routes into other applications (BGP,OSPF, etc.,)
4. Responsible for calling ASICd thrift APIs to program the routes in the FIB.

Architecture
************
.. image:: images/RIBd_Architecture.png


Policy Manager
**************
    RIB also doubles in as policy mamager. Policy objects are configured and organized in a hierarchical fashion as follows:

.. image:: images/policyObjects.png

A policy definition object contains one or more policy statements which in turn contains one or more policy conditions.
These are the steps for configuring policies:

#. 

    create a policy condition object.
	
         A policy condition object is used to define any matching condition/filter. The condition types can be to match destination/source  IP prefix or to match a route protocol etc. 
#.

    create a policy statement object which uses the condition objects
	
        Policy statement object is a set of conditions and has a matchtype attribute which indicates whether all or any of the conditions        need to me matched for the statement to be a hit.	
#.
	
    create a policy definition object which uses statement objects.
	
        Policy definition objects are defined as set of statements ordered with a priority. Priority of the statement dictates the order of evaluation of the statement. Policy object itself also has a priority attribute which dictates the order of evaluation of the policy.
	