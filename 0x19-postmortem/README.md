
![Sql1](https://github.com/O-G-W-A-L/0x19-postmortem/assets/138779092/a7c87fbd-de1b-4f3f-82fe-9eb9e7512124)
![1](https://github.com/O-G-W-A-L/0x19-postmortem/assets/138779092/c0b0d9a8-b391-49b5-9255-75349462a23c)

### POSTMORTEM: UNAUTHORIZED ACCESS TO CUSTOMER DATABASE
### Incident Description:
#### On May 7, 2024, at 00:00 hours, an external security alert from our intrusion detection system (IDS) indicated suspicious activity originating from an unknown IP address. This led to a Global outage of our web application firewall resulting into;-
    • 100% of incoming web traffic not being filtered for security threats
    • 40% of customer websites exposed to potential security breaches
    • Increased risk of DDoS attacks and data breaches

### Timeline:
#### May 7, 2024
#### 00:01:
+ Intrusion Detection System (IDS) triggered an alert for suspicious activity targeting a web application server and also an alert triggered for WAF system failure
+ The alert indicates attempted exploitation of a SQL injection vulnerability.
#### 00:20:
+ The security team noticed WAF system not responding and began investigating to identify the source of the attack.
+ The team isolates the web application server to prevent further unauthorized access attempts.
+ Initial assumption was network connectivity issue, investigation focused on routing and switching equipment
#### 00:30:
+ The team analyzed server logs to determine the extent of the breach.
+ Initial investigation suggests a successful SQL injection attack, potentially compromising a customer database.
+ Also discovered software bug in Web Application Firewall system's rule update process
#### 1:00:
+ The team identifies the specific customer data accessed during the breach.
+ This includes customer names, email addresses, and hashed passwords.
#### 2:00:
+ The team began patching the SQL injection vulnerability on the web application server. Identified and resolved failover configuration issue
+ Additional security measures are implemented to strengthen application security.
#### 5:00:
+ The security team completes the vulnerability patching process and confirms the web application server is secure and also deployed fix and restored Web Application Firewall system
#### 6:00:
+ The security team drafts a communication plan to inform affected customers about the incident.
+ This includes details of the breach, the data potentially compromised, and steps taken to mitigate the risk.
#### 7:00:
+ An official communication is sent to affected customers via email, explaining the incident and outlining recommended actions, such as password resets.
#### Root Cause Analysis:
![5](https://github.com/O-G-W-A-L/0x19-postmortem/assets/138779092/ca26ac11-6bce-4ab2-ab55-8436700a5202)
+ The root cause of the incident was a successful SQL injection attack against a vulnerable web application server. The attacker exploited a misconfigured Web Application Firewall that allowed them to inject malicious SQL code into database queries. This ultimately granted them unauthorized access to the customer database.
#### Contributing Factors:
+ Unpatched vulnerability: The web application server contained a known SQL injection vulnerability that had not been patched.
+ Misconfigured WAF. The WAF was misconfigured allowing the attacker to bypass security controls. 
+ Insufficient input validation: The application lacked proper input validation mechanisms to prevent malicious code injection attempts.
#### Resolution and preventive methods:
+ Patched vulnerability: The security team successfully patched the SQL injection vulnerability on the web application server.
+ Reconfigured Web Application Firewall. The web Application Firewall was properly reconfigured with proper failover settings and rules to block similar attacks
+ Enhanced application security: Additional security measures were implemented to strengthen the overall security posture of the web application.
+ Customer notification: Affected customers were promptly informed about the incident through email communication.
Regular security audits: Implement a program for regular security audits of web applications and infrastructure to identify and address vulnerabilities proactively.
+ Data encryption: Consider implementing encryption for sensitive customer data stored in databases to minimize the impact of potential breaches.
+ Regular vulnerability assessments, secure coding practices, and robust incident response plans are essential for mitigating security risks. Additionally, prompt communication with affected customers during security incidents is paramount for maintaining trust and minimizing the impact of such events.
