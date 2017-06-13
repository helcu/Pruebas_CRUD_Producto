package com.upc.edu.test.seleniumwd.pom;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.Select;

import com.upc.edu.test.seleniumwd.pom.driver.FastShopDriver;

public class ProductoPage {

	//private By linkMntCategoria = By.xpath("//*[@id=\"frmMenu:j_idt18\"]/ul/li[2]/a");
	private By btnNuevo = By.xpath("//a[contains(.,'Nuevo')]");
	
	private By cajaName = By.id("nombre");
	private By cajaDesc = By.id("desc");
	
	private By cajaCateg = By.id("catego");
	private By cajaPrize = By.id("precio");
	
	private By cajaNaci = By.id("nacional");
	
	private By cajaDescontinuado = By.id("descontinuado");
	private By btnAceptar = By.xpath("//button[contains(.,'Guardar')]");
	private By btnYes = By.xpath("//button[contains(.,'Sí')]");
	private By mensajeRespuesta = By.id("message");
	private WebDriver webDriver = null;
	
	public ProductoPage(String navegador, boolean remoto) {
		webDriver = FastShopDriver.inicializarDriver(navegador, remoto);
	}
	
	public ProductoPage(String navegador, WebDriver webDriver) {
		this.webDriver = webDriver;
	}

	public String insertar(String nombre, String desc, String categ, String prize,
			String nacion, String descontinuado) throws Exception {
		webDriver.findElement(btnNuevo).click();
		Thread.sleep(1000);
		webDriver.findElement(cajaName).clear();
		webDriver.findElement(cajaName).sendKeys(nombre);
		webDriver.findElement(cajaDesc).click();
		webDriver.findElement(cajaDesc).sendKeys(desc);
			
		Select selectByVisibleText = new Select (webDriver.findElement(cajaCateg));
		selectByVisibleText.selectByValue(categ);
			
		webDriver.findElement(cajaPrize).click();
		webDriver.findElement(cajaPrize).sendKeys(prize);
		
		
		int cajaNaciIndex = Boolean.parseBoolean(nacion) ? 0 : 1;
		webDriver.findElements(cajaNaci).get(cajaNaciIndex).click();
		
		if(Boolean.parseBoolean(descontinuado)) {
			webDriver.findElement(cajaDescontinuado).click();
		}
						
		Thread.sleep(2000);
		
		webDriver.findElement(btnAceptar).click();
		Thread.sleep(1000);
		webDriver.findElement(btnYes).click();
		Thread.sleep(3000);
		return webDriver.findElement(mensajeRespuesta).getText();
	}
	
	
	public String edit(String id, String nombre, String desc, String categ, String prize,
			String nacion, String descontinuado) throws Exception {
		
		By btnEdit = By.id("btnEditar" + id.toString());
		
		webDriver.findElement(btnEdit).click();
		Thread.sleep(1000);
		webDriver.findElement(cajaName).clear();
		webDriver.findElement(cajaName).sendKeys(nombre);
		webDriver.findElement(cajaDesc).clear();
		webDriver.findElement(cajaDesc).sendKeys(desc);
			
		Select selectByVisibleText = new Select (webDriver.findElement(cajaCateg));
		selectByVisibleText.selectByValue(categ);
			
		webDriver.findElement(cajaPrize).clear();
		webDriver.findElement(cajaPrize).sendKeys(prize);
		
		
		int cajaNaciIndex = Boolean.parseBoolean(nacion) ? 0 : 1;
		webDriver.findElements(cajaNaci).get(cajaNaciIndex).click();
		
		if(Boolean.parseBoolean(descontinuado)) {
			webDriver.findElement(cajaDescontinuado).click();
		}
						
		Thread.sleep(2000);
		
		webDriver.findElement(btnAceptar).click();
		Thread.sleep(1000);
		webDriver.findElement(btnYes).click();
		Thread.sleep(3000);
		return webDriver.findElement(mensajeRespuesta).getText();
	}
	
	
	public void cerrarPagina(){
		FastShopDriver.cerrarPagina(webDriver);
	}
	
	public WebDriver getWebDriver() {
		return webDriver;
	}

}
