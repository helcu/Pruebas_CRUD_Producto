package com.upc.edu.test.seleniumwd.pom;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import com.upc.edu.test.seleniumwd.pom.driver.FastShopDriver;

public class IniciarSesionPage {

	private By cajaUser = By.id("user");
	private By cajaPass = By.id("pass");
	private By btnLogin = By.xpath("//button[contains(.,'Iniciar sesión')]");
	private String urlInicial;
	private WebDriver webDriver = null;
	
	public IniciarSesionPage(String navegador, String urlInicial, boolean remoto){
		webDriver = FastShopDriver.inicializarDriver(navegador, remoto);
		this.urlInicial = urlInicial;
	}
	
	public void iniciarSesion(String usuario, String clave) throws Exception{
		webDriver.get(urlInicial);
		webDriver.findElement(cajaUser).clear();
		webDriver.findElement(cajaUser).sendKeys(usuario);
		webDriver.findElement(cajaPass).clear();
		webDriver.findElement(cajaPass).sendKeys(clave);
		webDriver.findElement(btnLogin).click();
		Thread.sleep(1000);
	}
	
	public void cerrarPagina(){
		FastShopDriver.cerrarPagina(webDriver);
	}
	
	public WebDriver getWebDriver() {
		return webDriver;
	}
	
}
