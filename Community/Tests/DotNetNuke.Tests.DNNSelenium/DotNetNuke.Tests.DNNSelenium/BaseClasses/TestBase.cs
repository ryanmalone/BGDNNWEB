﻿using System;
using System.Diagnostics;
using System.IO;
using System.Xml.Linq;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.IE;

namespace DotNetNuke.Tests.DNNSelenium.BaseClasses
{
	public class TestBase
	{
		private IWebDriver _driver;

		protected IWebDriver StartBrowser(string browserType)
		{
			if (_driver != null)
			{
				_driver.Quit();
			}

			_driver = StartDriver (browserType);

			return _driver;
		}

		internal static IWebDriver StartDriver (string browserType)
		{
			Trace.WriteLine("Start browser: '" + browserType + "'");

			IWebDriver driver = null;
			switch (browserType)
			{
				case "ie":
					{
						driver = new InternetExplorerDriver("Drivers");
						break;
					}
				case "firefox":
					{
						FirefoxProfile firefoxProfile = new FirefoxProfile();
						firefoxProfile.EnableNativeEvents = true;
						firefoxProfile.AcceptUntrustedCertificates = true;

						driver = new FirefoxDriver(firefoxProfile);
						break;
					}
				case "chrome":
					{
						ChromeOptions chromeOptions = new ChromeOptions();
						chromeOptions.AddArgument("--disable-keep-alive");

						driver = new ChromeDriver("Drivers", chromeOptions);
						break;
					}
			}

			driver.Manage().Window.Maximize();
			return driver;
		}

		protected void TryTest (Action<XElement> test, XElement settings)
		{
			try
			{
				test(settings);
			}
			catch (Exception e)
			{
				Trace.WriteLine("EXCEPTION =>" + e.Message + e.StackTrace);
				throw;
			}
		}

		protected T CreatePage<T>()
		{
			return (T)(object)CreatePage(typeof(T));
		}

		protected BasePage CreatePage(Type pageType)
		{
			var Page = Activator.CreateInstance(pageType, new object[] { _driver });

			return (BasePage)Page;
		}

		protected BasePage CreatePage(string pageClassName)
		{
			Type pageType = Type.GetType("DotNetNuke.Tests.DNNSelenium.CorePages." + pageClassName);

			return CreatePage(pageType);
		}

		protected BasePage OpenPage(string pageClassName, string openMethod, string baseUrl)
		{
			Type pageClassType = Type.GetType("DotNetNuke.Tests.DNNSelenium.CorePages." + pageClassName);

			var Page = Activator.CreateInstance(pageClassType, new object[] { _driver });

			var miOpen = pageClassType.GetMethod(openMethod);
			if (miOpen != null)
			{
				miOpen.Invoke(Page, new object[] { baseUrl });
			}
			else
			{
				Trace.WriteLine(BasePage.RunningTestKeyWord + "ERROR: cannot call " + openMethod + "for class " + pageClassName);
			}

			return (BasePage)Page;
		}

		[TestFixtureTearDown]
		public void TearDown()
		{
			Trace.WriteLine("Stop browser");

			if (_driver != null)
			{
				_driver.Quit();
				_driver = null;
			}
		}
	}
}
