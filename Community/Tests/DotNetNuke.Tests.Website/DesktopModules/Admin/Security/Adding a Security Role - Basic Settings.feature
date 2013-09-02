Feature: Adding a Security Role - Basic Settings
	In order to add a new role to my website
	As a Module Editor
	I want to be able to add a new security role with basic information only

Scenario Outline: How to add a basic security role to a site using the Security Roles module
	Given There is a Page called Security Roles with these permissions
		| Role           | Permission | Value   |
		| Administrators | View       | Allowed |
	And There is a Security Roles module on the page with these permissions
		| Role           | Permission | Value   |
		| Administrators | View       | Allowed |
	And Login as UID=<Scenario User Name> PWD=<Scenario Password> Role=<Scenario Role>
	And There is no role <Security Role>
	When Click the Add New Role link
	And Select the Basic Settings tab
	And In the Role Name text box, enter a name for the <Security Role>
	And In the Description text box, enter a brief description of this role <Description>
	And At Role Group, select a group for this role if desired
	And At Public Role, select <Public Role>
	And At Auto Assignment select <Auto Assignment>
	And At Security Mode select <Security Mode>
	And At Status select <Status>
	And Click the Security Role Update Button
Examples:
	| Scenario User Name | Scenario Password | Scenario Role  | Security Role | Description        | Public Role | Auto Assignment | Security Mode | Status   |
	| deadmau5           | password          | Administrators | Sample Role   | Describe this role | True        | False           | SecurityRole  | Approved |
	| philt3r            | password          | Administrators | Test Role     | Describe that role | False       | False           | SocialGroup   | Pemdimg  |
