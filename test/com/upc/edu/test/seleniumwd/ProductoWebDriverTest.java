package com.upc.edu.test.seleniumwd;

import org.testng.Assert;
import org.testng.ITestContext;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

import com.upc.edu.test.seleniumwd.pom.IniciarSesionPage;
import com.upc.edu.test.seleniumwd.pom.ProductoPage;
import com.upc.edu.test.util.excel.Excel;


public class ProductoWebDriverTest {

	private String urlInicial = "http://localhost:8080/CRUD_Producto-1.0-SNAPSHOT";
	private ProductoPage productoPage;
	private IniciarSesionPage iniciarSesionPage;
	
	@BeforeTest
	@Parameters({"navegador", "remoto"})
	public void inicioClase(String navegador, int remoto) throws Exception {
		iniciarSesionPage = new IniciarSesionPage(navegador, urlInicial, remoto == 1);
		productoPage = new ProductoPage(navegador, iniciarSesionPage.getWebDriver());
	}
	
	@DataProvider(name = "datosProductoAdd")
	public static Object[][] datosProductoAdd(ITestContext context) {
		Object[][] datos = null;
		String fuenteDatos = context.getCurrentXmlTest().getParameter("fuenteDatos");
		System.out.println("Fuente de Datos: " + fuenteDatos);
		switch(fuenteDatos){
			case "Excel":
				String rutaArchivo = context.getCurrentXmlTest().getParameter("rutaArchivoProductoAdd");
				datos = Excel.leerExcel(rutaArchivo);
				break;
		}
		return datos;
	}
	
	@DataProvider(name = "datosProductoEdit")
	public static Object[][] datosProductoEdit(ITestContext context) {
		Object[][] datos = null;
		String fuenteDatos = context.getCurrentXmlTest().getParameter("fuenteDatos");
		System.out.println("Fuente de Datos: " + fuenteDatos);
		switch(fuenteDatos){
			case "Excel":
				String rutaArchivo = context.getCurrentXmlTest().getParameter("rutaArchivoProductoEdit");
				datos = Excel.leerExcel(rutaArchivo);
				break;
		}
		return datos;
	}
	
	
	@Test(dataProvider = "datosProductoAdd")
	public void insertarProducto(String nombre, String desc, String categ, String prize,
			String nacion, String descontinuado, String valorEsperado) throws Exception {
		try {
			iniciarSesionPage.iniciarSesion("admin", "admin");
			String valorObtenido = productoPage.insertar(nombre.trim(), desc.trim(), categ, prize, nacion, descontinuado);
			Assert.assertEquals(valorEsperado , valorObtenido);
		}catch (Exception e) {
			e.printStackTrace();
			Assert.fail();
		}
	}
	
	@Test(dataProvider = "datosProductoEdit", dependsOnMethods = {"insertarProducto"})
	public void editarProducto(String id, String nombre, String desc, String categ, String prize,
			String nacion, String descontinuado, String valorEsperado) throws Exception {
		try {
			iniciarSesionPage.iniciarSesion("admin", "admin");
			String valorObtenido = productoPage.edit(id.trim(), nombre.trim(), desc.trim(), categ, prize, nacion, descontinuado);
			Assert.assertEquals(valorEsperado , valorObtenido);
		}catch (Exception e) {
			e.printStackTrace();
			Assert.fail();
		}
	}
	
	@AfterTest
	public void tearDown() throws Exception {
		productoPage.cerrarPagina();
	}
	
}
