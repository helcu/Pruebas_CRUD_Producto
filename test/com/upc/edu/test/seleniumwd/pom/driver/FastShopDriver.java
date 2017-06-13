package com.upc.edu.test.seleniumwd.pom.driver;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;

public final class FastShopDriver {

	public final static WebDriver inicializarDriver(String navegador, boolean remoto) {
		WebDriver webDriver = null;
		System.out.println("Ejecución Remota: " + (remoto ? "SI" : "NO"));
		switch (navegador) {
		case "firefox":
			System.setProperty("webdriver.gecko.driver",
					"W:\\_Experimentos\\geckodriver.exe");
			webDriver = new FirefoxDriver();
			break;
		case "chrome":
			System.setProperty("webdriver.chrome.driver",
					"W:\\_Experimentos\\chromedriver.exe");
			webDriver = new ChromeDriver();
			break;
		case "ie":
			System.setProperty("webdriver.ie.driver",
					"W:\\_Experimentos\\IEDriverServer.exe");
			webDriver = new InternetExplorerDriver();
			break;
		}
		
		webDriver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
		return webDriver;
	}

	public final static void cerrarPagina(WebDriver webDriver) {
		if (webDriver != null) {
			webDriver.quit();
		}
	}

}
