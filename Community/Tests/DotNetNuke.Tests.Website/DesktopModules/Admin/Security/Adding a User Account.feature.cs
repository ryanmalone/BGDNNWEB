﻿// ------------------------------------------------------------------------------
//  <auto-generated>
//      This code was generated by SpecFlow (http://www.specflow.org/).
//      SpecFlow Version:1.9.0.77
//      SpecFlow Generator Version:1.9.0.0
//      Runtime Version:4.0.30319.18010
// 
//      Changes to this file may cause incorrect behavior and will be lost if
//      the code is regenerated.
//  </auto-generated>
// ------------------------------------------------------------------------------
#region Designer generated code
#pragma warning disable
namespace DotNetNuke.Tests.Website.DesktopModules.Admin.Security
{
    using TechTalk.SpecFlow;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("TechTalk.SpecFlow", "1.9.0.77")]
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [NUnit.Framework.TestFixtureAttribute()]
    [NUnit.Framework.DescriptionAttribute("How to add a new user to a DotNetNuke site using the Add New User module")]
    public partial class HowToAddANewUserToADotNetNukeSiteUsingTheAddNewUserModuleFeature
    {
        
        private static TechTalk.SpecFlow.ITestRunner testRunner;
        
#line 1 "Adding a User Account.feature"
#line hidden
        
        [NUnit.Framework.TestFixtureSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "How to add a new user to a DotNetNuke site using the Add New User module", "In order to have users on the site\r\nAs an adminstrator\r\nI want to be able to add " +
                    "new users", ProgrammingLanguage.CSharp, ((string[])(null)));
            testRunner.OnFeatureStart(featureInfo);
        }
        
        [NUnit.Framework.TestFixtureTearDownAttribute()]
        public virtual void FeatureTearDown()
        {
            testRunner.OnFeatureEnd();
            testRunner = null;
        }
        
        [NUnit.Framework.SetUpAttribute()]
        public virtual void TestInitialize()
        {
        }
        
        [NUnit.Framework.TearDownAttribute()]
        public virtual void ScenarioTearDown()
        {
            testRunner.OnScenarioEnd();
        }
        
        public virtual void ScenarioSetup(TechTalk.SpecFlow.ScenarioInfo scenarioInfo)
        {
            testRunner.OnScenarioStart(scenarioInfo);
        }
        
        public virtual void ScenarioCleanup()
        {
            testRunner.CollectScenarioErrors();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("Add User from the Users Accounts Logged In As a User in the Administrators Role")]
        [NUnit.Framework.TestCaseAttribute("deadmau5", "password", "Administrators", "wilson", "Jon", "Wilson", "Wilson", "wilson@dnncorp.com", "True", "True", "False", "password", "password", null)]
        [NUnit.Framework.TestCaseAttribute("philt3r", "password", "Administrators", "tiesto", "The", "Dutchman", "Tiesto", "tiesto@dnncorp.com", "True", "True", "False", "password", "password", null)]
        public virtual void AddUserFromTheUsersAccountsLoggedInAsAUserInTheAdministratorsRole(string scenarioUserName, string scenarioPassword, string scenarioRole, string userName, string firstName, string lastName, string displayName, string email, string authorize, string notify, string randomPassword, string password, string confirmPassword, string[] exampleTags)
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("Add User from the Users Accounts Logged In As a User in the Administrators Role", exampleTags);
#line 6
this.ScenarioSetup(scenarioInfo);
#line hidden
            TechTalk.SpecFlow.Table table1 = new TechTalk.SpecFlow.Table(new string[] {
                        "Role",
                        "Permission",
                        "Value"});
            table1.AddRow(new string[] {
                        "Administrators",
                        "View",
                        "Allowed"});
#line 7
 testRunner.Given("There is a Page called User Accounts with these permissions", ((string)(null)), table1, "Given ");
#line hidden
            TechTalk.SpecFlow.Table table2 = new TechTalk.SpecFlow.Table(new string[] {
                        "Role",
                        "Permission",
                        "Value"});
            table2.AddRow(new string[] {
                        "Administrators",
                        "View",
                        "Allowed"});
#line 10
 testRunner.And("There is a User Accounts module on the page with these permissions", ((string)(null)), table2, "And ");
#line 13
 testRunner.And(string.Format("There is no user {0}", userName), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 14
 testRunner.And(string.Format("Login as UID={0} PWD={1} Role={2}", scenarioUserName, scenarioPassword, scenarioRole), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 15
 testRunner.And("Click the Add New User link. This opens the Add New User interface", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 16
 testRunner.When(string.Format("In the User Name text box, enter {0}", userName), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 17
 testRunner.And(string.Format("In the First Name text box, enter {0}", firstName), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 18
 testRunner.And(string.Format("In the Last Name text box, enter {0}", lastName), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 19
 testRunner.And(string.Format("In the Display Name text box, enter {0}", userName), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 20
 testRunner.And(string.Format("In the Email Address text box, enter {0}", email), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 21
 testRunner.And(string.Format("At Authorize, select {0}", authorize), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 22
 testRunner.And(string.Format("At Notify, select {0}", notify), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 23
 testRunner.And(string.Format("I set Add User Random Password to {0}", randomPassword), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 24
 testRunner.And(string.Format("In the Password text box, enter {0}", password), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 25
 testRunner.And(string.Format("In the Confirm Password text box, re-enter the same password {0}", confirmPassword), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 26
 testRunner.And("Click the Add New User link.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 27
 testRunner.Then("The newly added user account can now be viewed and modified using the User Accoun" +
                    "ts module", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line 28
 testRunner.And("If Authorize is checked the new user will automatically gain access to the Regist" +
                    "ered User role and any roles set for Auto Assignment", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 29
 testRunner.And("If Authorize is unchecked the new user will be created but will not be able to ac" +
                    "cess the restricted areas of the site", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 30
 testRunner.And("If Notify is checked the new user will be sent a notification email", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 31
 testRunner.And("If Notify is unchecked the new user will not be sent a notification email", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion