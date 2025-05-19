1. Only the latest released version of a module MUST be supported. [ID SNFR12](https://azure.github.io/Azure-Verified-Modules/specs/bcp/ptn/#id-snfr12---category-contributionsupport---versions-supported): For example, if an AVM Resource Module is used in an AVM Pattern Module that was working but now is not. The first step by the AVM Pattern Module owner should be to upgrade to the latest version of the AVM Resource Module test and then if not fixed, troubleshoot and fix forward from the that latest version of the AVM Resource Module onwards.

This avoids AVM Module owners from having to maintain multiple major release versions.

2. ID: SFR2 - Category: Composition - WAF Aligned
Modules SHOULD set defaults in input parameters/variables to align to high priority/impact/severity recommendations, where appropriate and applicable, in the following frameworks and resources:

[Well-Architected Framework (WAF)](https://learn.microsoft.com/en-us/azure/well-architected/what-is-well-architected-framework)

[Reliability Hub](https://learn.microsoft.com/en-us/azure/reliability/overview-reliability-guidance)
[Azure Proactive Resiliency Library (APRL)](https://azure.github.io/Azure-Proactive-Resiliency-Library-v2/welcome/)

Only Product Group (PG) verified

[Microsoft Defender for Cloud (MDFC)](https://learn.microsoft.com/en-us/azure/defender-for-cloud/plan-multicloud-security-get-started)
They SHOULD NOT align to these recommendations when it requires an external dependency/resource to be deployed and configured and then associated to the resources in the module.

Alignment SHOULD prioritize best-practices and security over cost optimization, but MUST allow for these to be overridden by a module consumer easily, if desired.