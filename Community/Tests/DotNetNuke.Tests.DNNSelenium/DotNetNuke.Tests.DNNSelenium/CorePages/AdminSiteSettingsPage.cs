using System.Diagnostics;
using System.Threading;
using DotNetNuke.Tests.DNNSelenium.BaseClasses;
using DotNetNuke.Tests.DNNSelenium.Properties;
using OpenQA.Selenium;

namespace DotNetNuke.Tests.DNNSelenium.CorePages
{
	class AdminSiteSettingsPage : BasePage
	{
		public AdminSiteSettingsPage(IWebDriver driver) : base(driver) { }

		public static string AdminSiteSettingsUrl = "/Admin/SiteSettings";

		public static string PageTitleLabel = "Site Settings";
		public static string PageHeader = "Site Settings";

		public static string AdvancedSettingsTab = "//a[@href = '#ssAdvancedSettings']";

		public static string UsabilitySettingsAccordion = "//h2[@id='dnnSitePanel-Usability']/a";

		public static string EnablePopups = "//input[contains(@id, 'SiteSettings_enablePopUpsCheckBox')]";

		public static string UpdateButton = "//a[contains(@id, 'SiteSettings_cmdUpdate')]";

		public void OpenUsingUrl(string baseUrl)
		{
			Trace.WriteLine(BasePage.TraceLevelPage + "Open Admin '" + PageTitleLabel + "' page:");
			GoToUrl(baseUrl + AdminSiteSettingsUrl);
		}

		public void OpenUsingButtons(string baseUrl)
		{
			GoToUrl(baseUrl);
			Trace.WriteLine(BasePage.TraceLevelPage + "Open Admin '" + PageTitleLabel + "' page:");
			WaitAndClick(By.XPath(AdminPage.AdminTopMenuLink));
			WaitAndClick(By.XPath(AdminPage.SiteSettingsLink));
		}

		public void OpenUsingControlPanel(string baseUrl)
		{
			GoToUrl(baseUrl);
			Trace.WriteLine(BasePage.TraceLevelPage + "Open Admin '" + PageTitleLabel + "' page:");
			SelectSubMenuOption(BasePage.ControlPanelAdminOption, BasePage.ControlPanelAdminCommonSettings, BasePage.AdminSiteSettingsOption);
		}

		public void OpenAdvancedSettingsTab()
		{
			WaitAndClick(By.XPath(AdvancedSettingsTab));
		}

		public void ClickOnUpdateButton()
		{
			Trace.WriteLine(BasePage.TraceLevelPage + "Click on 'Update' button:");
			FindElement(By.XPath(UpdateButton)).ScrollIntoView().WaitTillVisible().Click();
		}

		public void DisablePopups()
		{
			OpenAdvancedSettingsTab();
			AccordionOpen(By.XPath(UsabilitySettingsAccordion));

			CheckBoxUncheck( By.XPath(EnablePopups));

			ClickOnUpdateButton();

			Thread.Sleep(Settings.Default.WaitFactor * 2000);
		}
	}
}
