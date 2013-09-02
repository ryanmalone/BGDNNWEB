using System.Diagnostics;
using DotNetNuke.Tests.DNNSelenium.BaseClasses;
using OpenQA.Selenium;

namespace DotNetNuke.Tests.DNNSelenium.CorePages
{
	class AdminPage : BasePage
	{
		public AdminPage (IWebDriver driver) : base (driver) {}

		public static string AdminPageUrl = "/Admin";

		public static string AdminTopMenuLink = "//ul[@id='ControlNav']/li[1]/a";

		public static string PageTitleLabel = "Basic Features";
		public static string PageHeader = "";

		public static string AdvancedConfigurationSettingsLink = "//div[a/img[contains(@src, 'AdvancedSettings_32X32_Standard.png')]]";
		public static string AdvancedUrlManagementLink = "//div[a/img[contains(@src, 'AdvancedUrlMngmt_32x32.png')]]";
		public static string ContentStagingLink = "//div[a/img[contains(@src, 'icon_staging_32px.gif')]]";
		public static string DevicePreviewManagementLink = "//div[a/img[contains(@src, 'DevicePreview_Standard_32X32.png')]]";
		public static string DigitalAssetsLink = "//div[a/img[contains(@src, 'Files_32X32_Standard.png')]]";
		public static string GamingMechanicsLink = "//div[a/img[contains(@src, 'icon_unknown_32px.gif')]]";
		public static string EventViewerLink = "//div[a/img[contains(@src, 'ViewStats_32X32_Standard.png')]]";
		public static string ExtensionsLink = "//div[a/img[contains(@src, 'Extensions_32X32_Standard.png')]]";
		public static string GoogleAnalyticsProLink = "//div[a/img[contains(@src, 'GoogleAnalytics_32X32_Standard.png')]]";
		public static string LanguagesLink = "//div[a/img[contains(@src, 'Languages_32X32_Standard.png')]]";
		public static string ListsLink = "//div[a/img[contains(@src, 'Lists_32X32_Standard.png')]]";
		public static string NewslettersLink = "//div[a/img[contains(@src, 'BulkMail_32X32_Standard.png')]]";
		public static string PageManagementLink = "//div[a/img[contains(@src, 'Tabs_32X32_Standard.png')]]";
		public static string RecycleBinLink = "//div[a/img[contains(@src, 'Trash_32X32_Standard.png')]]";
		public static string SearchAdminLink = "//div[a/img[contains(@src, 'Search_32x32_Standard.png')]]";
		public static string SearchEngineLink = "//div[a/img[contains(@src, 'Sitemap_32X32_Standard.png')]]";
		public static string SecurityRolesLink = "//div[a/img[contains(@src, 'SecurityRoles_32X32_Standard.png')]]";
		public static string SharePointConnectorLink = "//div[a/img[contains(@src, 'SharePoint_32x32.png')]]";
		public static string SiteLogLink = "//div[a/img[contains(@src, 'SiteLog_32X32_Standard.png')]]";
		public static string SiteRedirectionManagementLink = "//div[a/img[contains(@src, 'MobileManagement_Standard_32x32.png')]]";
		public static string SiteSettingsLink = "//div[a/img[contains(@src, 'SiteSettings_32X32_Standard.png')]]";
		public static string SiteWizardLink = "//div[a/img[contains(@src, 'Wizard_32X32_Standard.png')]]";
		public static string SkinsLink = "//div[a/img[contains(@src, 'Skins_32X32_Standard.png')]]";
		public static string TaxonomyLink = "//div[a/img[contains(@src, 'Tag_32X32_Standard.png')]]";
		public static string UserAccountsLink = "//div[a/img[contains(@src, 'Users_32X32_Standard.png')]]";
		public static string VendorsLink = "//div[a/img[contains(@src, 'Vendors_32X32_Standard.png')]]";

		public static string FeaturesList = "//div[contains(@id, 'ViewConsole_Console')]/div/div[@class = 'console-large']";
		public static int NumberOfLinksCEPackage = 22;
		public static int NumberOfLinksPEPackage = 23;
		public static int NumberOfLinksEEPackage = 25;
		public static int NumberOfLinksSocial = 22;

		public void OpenUsingUrl(string baseUrl)
		{
			Trace.WriteLine(BasePage.TraceLevelPage + "Open Admin '" + PageTitleLabel + "' page:");
			GoToUrl(baseUrl + AdminPageUrl);
		}

		public void OpenUsingButtons(string baseUrl)
		{
			GoToUrl(baseUrl);
			Trace.WriteLine(BasePage.TraceLevelPage + "Open Admin '" + PageTitleLabel + "' page:");
			Click(By.XPath(AdminTopMenuLink));
		}
	}
}
