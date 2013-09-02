using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Xml.Linq;
using DotNetNuke.Tests.DNNSelenium.BaseClasses;
using OpenQA.Selenium;

namespace DotNetNuke.Tests.DNNSelenium.CorePages
{
	public class InstallerPage : BasePage
	{
		public InstallerPage(IWebDriver driver)
			: base(driver)
		{
		}

		#region IDs

		public static string InstallerPageTitle = "lblDotNetNukeInstalltion";
		public static string DnnLogo = "DotNetNuke";

		public static string AccountInfoTab = "accountInfo";
		public static string InstallInfoTab = "installInfo";
		public static string WebInfoTab = "webInfo";

		public static string UserName = "txtUsername";
		public static string UserNameLabel = "lblUsername_lblLabel";

		public static string Password = "txtPassword";
		public static string PasswordLabel = "lblPassword_lblLabel";

		public static string ConfirmPassword = "txtConfirmPassword";
		public static string ConfirmPasswordLabel = "lblConfirmPassword_lblLabel";

		public static string WebsiteName = "txtWebsiteName";
		public static string WebsiteNameLabel = "lblWebsiteName_lblLabel";

		public static string TemplateLabel = "lblTemplate_lblLabel";
		public static string TemplateArrow = "templateList_Arrow";
		public static string TemplateDropdown = "//div[@id='templateList_DropDown']";

		public static string LanguageLabel = "lblLanguage_lblLabel";
		public static string LanguageArrow = "languageList_Arrow";
		public static string LanguageDropdown = "//div[@id='languageList_DropDown']";


		public static string EnglishIconId = "lang_en_US";
		public static string GermanIconId = "lang_de_DE";
		public static string SpanishIconId = "lang_es_ES";
		public static string FrenchIconId = "lang_fr_FR";
		public static string ItalianIconId = "lang_it_IT";
		public static string HollandIconId = "lang_nl_NL";

		public static string AdvancedDatabaseInfo = "advancedDatabase";

		public static string DatabaseSetupLabel = "lblDatabaseSetup_lblLabel";
		public static string DatabaseSetupDefault = "databaseSetupType_0";
		public static string DatabaseSetupDefaultLabel = "//label[@for='databaseSetupType_0']";

		public static string DatabaseSetupCustom = "databaseSetupType_1";
		public static string DatabaseSetupCustomLabel = "//label[@for='databaseSetupType_1']";

		public static string DatabaseTypeLabel = "lblDatabaseType_lblLabel";
		public static string DatabaseSetupTypeSqlExpress = "databaseType_0";
		public static string DatabaseSetupTypeSqlExpressLabel = "//label[@for='databaseType_0']";

		public static string DatabaseSetupTypeSqlServer = "databaseType_1";
		public static string DatabaseSetupTypeSqlServerLabel = "//label[@for='databaseType_1']";

		public static string DatabaseServer = "txtDatabaseServerName";
		public static string DatabaseServerLabel = "lblDatabaseServerName_lblLabel";

		public static string DatabaseName = "txtDatabaseName";
		public static string DatabaseNameLabel = "lblDatabaseName_lblLabel";

		public static string DatabaseObjectQualifier = "txtDatabaseObjectQualifier";
		public static string DatabaseObjectQualifierLabel = "lblDatabaseObjectQualifier_lblLabel";

		public static string DatabaseFilename = "txtDatabaseFilename";
		public static string DatabaseFilenameLabel = "lblDatabaseFilename_lblLabel";

		public static string DatabaseSecurityIntegrated = "databaseSecurityType_0";
		public static string DatabaseSecurityIntegratedLabel = "//label[@for='databaseSecurityType_0']";

		public static string DatabaseSecurityUserDefined = "databaseSecurityType_1";
		public static string DatabaseSecurityUserDefinedLabel = "//label[@for='databaseSecurityType_1']";

		public static string DatabaseUserName = "txtDatabaseUsername";
		public static string DatabaseUserNameLabel = "lblDatabaseUsername_lblLabel";

		public static string DatabasePassword = "txtDatabasePassword";
		public static string DatabasePasswordLabel = "lblDatabasePassword_lblLabel";

		public static string RunDatabaseAs = "databaseRunAs";
		public static string RunDatabaseAsLabel = "//label[@for='databaseRunAs']";


		public static string ContinueButton = "continueLink";

		public static string ProgressBar = "//div[@id='progressbar' and @aria-valuenow ='100']";
		public static string InstallStatus = "percentage";

		public static string RetryButton = "retry";
		public static string SeeLogsButton = "seeLogs";
		public static string InstallerLogContainer = "installation-log";
		public static string VisitSiteButton = "visitSite";

		public static string IntroVideo = "introVideo";
		public static string WhatIsNew = "whatsNewVideo";
		public static string LetMeAtIn = "btnLetMeAtIn";

		public static string InstallationSteps = "installation-steps";
		public static string FileAndFolderPermissionCheck = "FileAndFolderPermissionCheck";
		public static string DatabaseInstallation = "DatabaseInstallation";
		public static string ExtensionsInstallation = "ExtensionsInstallation";
		public static string WebsiteCreation = "WebsiteCreation";
		public static string SuperUserCreation = "SuperUserCreation";

		#endregion

		public static string AccountInfoError = "lblAccountInfoError";
		public static string WebsiteError = "lblWebsiteInfoError";
		public static string DatabaseError = "databaseError";
		public static string AdminError = "lblAdminInfoError";
		public static string LanguageError = "lblLegacyLangaugePack";
		public static string ErrorMessage = "txtErrorMessage";
		public static string Error = "lblError";
		public static string DatabaseInfo = "lblDatabaseInfoMsg";

		#region Dictionary
		private static readonly Dictionary<string, string> EnDictionary = new Dictionary<string, string>
			                                                {
				                                                {"Default Template", "Default Template"},
				                                                {"Mobile Template", "Mobile Template"},
																{"Blank Template", "Blank Template"},
																{"WelcomeScreenTitle", "Welcome to Your Installation"},
																{"PageTitle", "Installation"},
																{"InstallationLog", "No Installation Log"},
															};

		private static readonly Dictionary<string, string> DeDictionary = new Dictionary<string, string>
			                                                {
				                                                {"Default Template", "Standard-Vorlage"},
				                                                {"Mobile Template", "Vorlage f�r mobile Ger�te"},
																{"Blank Template", "leere Vorlage"},
																{"WelcomeScreenTitle", ""},
																{"PageTitle", "DotNetNuke-Installation"},
																{"InstallationLog", "Es gibt kein Installationsprotokoll"},
															};

		private static readonly Dictionary<string, string> EsDictionary = new Dictionary<string, string>
			                                                {
				                                                {"Default Template", "Plantilla predeterminada"},
				                                                {"Mobile Template", "Plantilla m�vil"},
																{"Blank Template", "Plantilla en blanco"},
																{"WelcomeScreenTitle", "Bienvenido a su sitio web DotNetNuke"},
																{"PageTitle", "Instalaci�n de DotNetNuke"},
																{"InstallationLog", "No hay registro de instalaci�n"},
															};

		private static readonly Dictionary<string, string> FrDictionary = new Dictionary<string, string>
			                                                {
				                                                {"Default Template", "Mod�le par d�faut"},
				                                                {"Mobile Template", "Mod�le pour mobile"},
																{"Blank Template", "Mod�le vierge"},
																{"WelcomeScreenTitle", "Bienvenue dans votre installation de DotNetNuke"},
																{"PageTitle", "Installation de DotNetNuke"},
																{"InstallationLog", "Aucun journal d'Installation"},
															};

		private static readonly Dictionary<string, string> ItDictionary = new Dictionary<string, string>
			                                                {
				                                                {"Default Template", "Template di Default"},
				                                                {"Mobile Template", "Template Mobile"},
																{"Blank Template", "Template Vuoto"},
																{"WelcomeScreenTitle", "Benvenuto nella nuova installazione di DotNetNuke"},
																{"PageTitle", "Installazione DotNetNuke"},
																{"InstallationLog", "Nessuna installazione Log"},
															};

		private static readonly Dictionary<string, string> NlDictionary = new Dictionary<string, string>
			                                                {
				                                                {"Default Template", "Standaard website"},
				                                                {"Mobile Template", "Mobiele website"},
																{"Blank Template", "Lege website"},
																{"WelcomeScreenTitle", "Welkom bij uw DotNetNuke installatie"},
																{"PageTitle", "DotNetNuke Installatie"},
																{"InstallationLog", "Geen installatie log"},
															};

		private static readonly Dictionary<string, Dictionary<string, string>> DictSelector = new Dictionary
			<string, Dictionary<string, string>>
			                                                {
																{"en", EnDictionary},
																{"de", DeDictionary},
																{"es", EsDictionary},
																{"fr", FrDictionary},
																{"it", ItDictionary},
																{"nl", NlDictionary},
			                                                };
		#endregion Dictionary

		public void ClickOnContinueButton()
		{
			Trace.WriteLine(BasePage.TraceLevelElement + "Click on 'Continue' button 'id: " + ContinueButton + "'");
			FindElement(By.Id(ContinueButton)).WaitTillEnabled().Click();
		}

		public void WaitForInstallationProcessToFinish()
		{
			Trace.WriteLine(BasePage.TraceLevelElement + "Wait for Installation Process to finish:");
			WaitForElement(By.XPath(ProgressBar), 100);
		}

		public void ClickOnSeeLogsButton()
		{
			Trace.WriteLine(BasePage.TraceLevelElement + "Click on 'See Logs' button 'id: " + SeeLogsButton + "'");
			WaitForElement(By.XPath("//a[@id='" + SeeLogsButton + "' and not(contains(@class, 'dnnDisabledAction'))]")).Click();
		}

		public void WaitForLogContainer()
		{
			Trace.WriteLine(BasePage.TraceLevelElement + "Wait for 'Log Container' is visible:");
			WaitForElement(By.Id(InstallerLogContainer)).WaitTillVisible(20);
			Trace.WriteLine(BasePage.TraceLevelElement + "Logs " + FindElement(By.Id(InstallerLogContainer)).Text);
		}

		public void ClickOnVisitWebsiteButton()
		{
			Trace.WriteLine(BasePage.TraceLevelElement + "Click on 'Visit Site' button 'id: " + VisitSiteButton + "'");
			FindElement(By.Id(VisitSiteButton)).WaitTillEnabled().Click();
		}

		public void OpenUsingUrl(string baseUrl)
		{
			Trace.WriteLine(BasePage.TraceLevelPage + "Open 'Installer' page:");
			GoToUrl(baseUrl);
		}

		public string SetLanguageOptionName(string language)
		{
			string option = null;

			switch (language)
			{
				case "en":
					{
						option = "English (United States)";
						break;
					}
				case "de":
					{
						option = "Deutsch (Deutschland)";
						break;
					}
				case "es":
					{
						option = "Espa�ol (Espa�a, alfabetizaci�n internacional)";
						break;
					}
				case "fr":
					{
						option = "fran�ais (France)";
						break;
					}
				case "it":
					{
						option = "italiano (Italia)";
						break;
					}
				case "nl":
					{
						option = "Nederlands (Nederland)";
						break;
					}
			}

			return option;
		} 

		public void SetInstallerLanguage(string installerLanguage)
		{
			Trace.WriteLine(BasePage.TraceLevelElement + "Select the language flag: '" + installerLanguage + "'");
			switch (installerLanguage)
			{
				case "en":
					{
						WaitForElement(By.Id(EnglishIconId), 10).WaitTillVisible(10).Click();
						WaitForElement(By.XPath("//a[@id='" + EnglishIconId + "'and contains(@class, 'selectedFlag')]"));
						break;
					}
				case "de":
					{
						WaitForElement(By.Id(GermanIconId)).Click();
						WaitForElement(By.XPath("//a[@id='" + GermanIconId + "'and contains(@class, 'selectedFlag')]"));
						break;
					}
				case "es":
					{
						WaitForElement(By.Id(SpanishIconId)).Click();
						WaitForElement(By.XPath("//a[@id='" + SpanishIconId + "'and contains(@class, 'selectedFlag')]"));
						break;
					}
				case "fr":
					{
						WaitForElement(By.Id(FrenchIconId)).Click();
						WaitForElement(By.XPath("//a[@id='" + FrenchIconId + "'and contains(@class, 'selectedFlag')]"));
						break;
					}
				case "it":
					{
						WaitForElement(By.Id(ItalianIconId)).Click();
						WaitForElement(By.XPath("//a[@id='" + ItalianIconId + "'and contains(@class, 'selectedFlag')]"));
						break;
					}
				case "nl":
					{
						WaitForElement(By.Id(HollandIconId)).Click();
						WaitForElement(By.XPath("//a[@id='" + HollandIconId + "'and contains(@class, 'selectedFlag')]"));
						break;
					}
			}
		}

		public void SetDictionary(string language)
		{
			_translate = DictSelector[language];
		}

		public void WelcomeScreen()
		{
			Trace.WriteLine(BasePage.TraceLevelComposite + "Login to the site first time, using 'Visit Website' button:");

			WaitAndSwitchToFrame(60);

			WaitForElement(By.Id(IntroVideo), 60).WaitTillVisible(60);
			WaitForElement(By.Id(WhatIsNew), 60).WaitTillVisible(60);

			WaitForElement(By.Id(LetMeAtIn), 60).WaitTillEnabled().Click();

			WaitAndSwitchToWindow(60);

		}

		public void FillAccountInfo(XElement settings)
		{
			const string customDatabaseSetup = "Custom";
			const string sqlServerDatabase = "SQL Server";
			const string userDefinedSecurity = "User Defined";

			string userName = settings.Attribute("UserName").Value;
			string password = settings.Attribute("Password").Value;
			string websiteName = settings.Attribute("WebsiteName").Value;
			string template = settings.Attribute("Template").Value;
			string language = settings.Attribute("Language").Value;
			string databaseSetup = settings.Attribute("DatabaseSetup").Value;
			string databaseSetupType = settings.Attribute("DatabaseType").Value;
			string databaseServerName = settings.Attribute("DatabaseServerName").Value;
			string databaseName = settings.Attribute("DatabaseName").Value;
			string databaseFilename = settings.Attribute("DatabaseFilename").Value;
			string objectQualifier = settings.Attribute("ObjectQualifier").Value;
			string databaseSecurity = settings.Attribute("Security").Value;
			string databaseUserName = settings.Attribute("DatabaseUserName").Value;
			string databasePassword = settings.Attribute("DatabasePassword").Value;
			bool runDatabaseAs = settings.Attribute("RunDatabaseAsDatabaseOwner")
										 .Value.Equals("yes", StringComparison.InvariantCultureIgnoreCase);

			Trace.WriteLine(BasePage.TraceLevelPage + "Fill Account Info: ");

			//UserName prepopulated with "host" value
			WaitForElement(By.Id(UserName), 20).WaitTillVisible(20);
			Clear(By.Id(UserName));
			Type(By.Id(UserName), userName);

			Type(By.Id(Password), password);

			Type(By.Id(ConfirmPassword), password);

			//WebsiteName prepopulated with "My Website" value
			Clear(By.Id(WebsiteName));
			Type(By.Id(WebsiteName), websiteName);

			SlidingSelectByValue( By.Id(TemplateArrow), By.XPath(TemplateDropdown), Translate(template));
			SlidingSelectByValue( By.Id(LanguageArrow), By.XPath(LanguageDropdown), SetLanguageOptionName(language));

			if (databaseSetup == customDatabaseSetup)
			{
				WaitForElement(By.Id(DatabaseSetupCustom));
				RadioButtonSelect(By.Id(DatabaseSetupCustom));

				WaitForElement(By.Id(DatabaseSetupTypeSqlServer));
				if (databaseSetupType == sqlServerDatabase)
				{
					RadioButtonSelect(By.Id(DatabaseSetupTypeSqlServer));

					WaitForElement(By.Id(DatabaseServer));
					Clear(By.Id(DatabaseServer));
					Type(By.Id(DatabaseServer), databaseServerName);
					Clear(By.Id(DatabaseName));
					Type(By.Id(DatabaseName), databaseName);

					if (databaseSecurity == userDefinedSecurity)
					{
						RadioButtonSelect(By.Id(DatabaseSecurityUserDefined));
						WaitForElement(By.Id(DatabaseUserName));
						Type(By.Id(DatabaseUserName), databaseUserName);
						Type(By.Id(DatabasePassword), databasePassword);
					}
					else
					{
						RadioButtonSelect(By.Id(DatabaseSecurityIntegrated));
					}
				}
				else
				{
					Clear(By.Id(DatabaseServer));
					Type(By.Id(DatabaseServer), databaseServerName);

					Clear(By.Id(DatabaseFilename));
					Type(By.Id(DatabaseFilename), databaseFilename);
				}

				Type(By.Id(DatabaseObjectQualifier), objectQualifier);

				if (runDatabaseAs == false)
				{
					CheckBoxCheck( By.Id(RunDatabaseAs));
				}
			}
			else
			{
				WaitForElement(By.Id(DatabaseSetupDefault));
				RadioButtonSelect(By.Id(DatabaseSetupDefault));
			}
		}
	}
}
