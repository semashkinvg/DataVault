# Data Vault

This repository relates to Data Vault 2.0 methodology introduced by Daniel Linstedt. This is the try to implement the methodology and see how it works in real business area - Government Contracts

# Rules
The rules below are what I'm going to implement within this repository. However, it might have some discrepancies from the real methodology

## Hub
 - Relates to the only one business entity (business key)
 - Hash Key is generated using SHA1 from business key (even though it's composite)
 
 ## Link
 - Relationship between hubs or/and satellites
 - Hash Key is generated using SHA1 from all the business keys consisted within current Link table
 
 ## Satellite
 - Describes the hub 
 - The attribues are grouped by meaning within one Satellite (Say the contract has dates and status, so that the contract hub will have at least two satellites)
