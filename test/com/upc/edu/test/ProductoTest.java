package com.upc.edu.test;
import static org.testng.Assert.assertEquals;
import static org.testng.Assert.assertTrue;

import java.util.List;

import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

import com.upc.edu.business.ProductoBusiness;
import com.upc.edu.entity.Producto;

public class ProductoTest {
  
	private final ProductoBusiness productoBusiness;
	private static Producto producto;
	
	
	public ProductoTest() {
		productoBusiness = new ProductoBusiness();
	}
	
	
	@BeforeClass
	public void inicioClase() {
		System.out.println("***** INICIO CLASE ProductoTest *****");
	}

	@AfterClass
	public void finClase() {
		System.out.println("****** FIN CLASE ProductoTest ******");
	}
	
	@BeforeTest
	public void inicioMetodo() {
		System.out.println("***** Inicio METODO ProductoTest *****");
	}

	@AfterTest
	public void finMetodo() {
		System.out.println("ProdId: " + producto.getCodigo());
		System.out.println("Nombre: " + producto.getNombre());
		System.out.println("Desc: " + producto.getDescripcion());
		System.out.println("CateId: " + producto.getCategoria());
		System.out.println("Precio: " + producto.getPrecio());
		System.out.println("isNaci: " + producto.isProductoNacional());
		System.out.println("isDesc: " + producto.isDescontinuado());
		System.out.println("***** FIN METODO ProductoTesT *****\n\n");
	}

	@Test(timeOut=1000)
	@Parameters({"nombreAdd","descAdd","categAdd","precAdd","isNacAdd","isDescAdd"})
	public void addProducto(String nombreInsertar, String descInsertar, int categInsertar,
			double precInsertar, boolean isNacInsertar, boolean isDescInsertar) {
		try{
			System.out.println("ADD PRODUCTO");
			producto = new Producto(-1, nombreInsertar, 
					descInsertar, categInsertar, precInsertar, isNacInsertar, isDescInsertar);
			productoBusiness.add(producto);
			assertTrue(nombreInsertar.equals(producto.getNombre()));
		}catch(Exception e){
			e.printStackTrace();
			Assert.fail();
		}
	}
	
	@Test(dependsOnMethods={"addProducto"}, timeOut=1000)
	@Parameters("nombreUpd")
	public void updateProducto(String nombreUpd) {
		try{
			System.out.println("UPDATE PRODUCTO");
			producto.setNombre(nombreUpd);
			productoBusiness.update(producto);
			assertTrue(nombreUpd.equals(producto.getNombre()));
		}catch(Exception e){
			e.printStackTrace();
			Assert.fail();
		}
	}
	
	@Test(dependsOnMethods={"updateProducto"}, timeOut=1000)
	public void getProductoByCodigo(){
		try{
			System.out.println("GET PRODUCTO BY CODIGO");
			final Producto productoBuscado = productoBusiness.getByCodigo(producto.getCodigo());
			assertEquals(producto, productoBuscado);
		}catch(Exception e){
			e.printStackTrace();
			Assert.fail();
		}
	}
	
	@Test(timeOut=3000)
	public void getProductos(){
		try{
			System.out.println("GET PRODUCTOS");
			final List<Producto> productos = productoBusiness.getProductos();
			assertTrue(productos != null);
		}catch(Exception e){
			e.printStackTrace();
			Assert.fail();
		}
	}
	
	@Test(timeOut=3000)
	@Parameters("productoInfo")
	public void getProductosByInfo(String productoInfo){
		try{
			System.out.println("GET PRODUCTOS BY INFO");
			final List<Producto> productos = productoBusiness.getProductosByInfo(productoInfo);
			assertTrue(productos != null);
		}catch(Exception e){
			e.printStackTrace();
			Assert.fail();
		}
	}	
	
	@Test(dependsOnMethods={"getProductoByCodigo"}, timeOut=1000)
	public void deleteProducto(){
		try{
			System.out.println("DELETE PRODUCTO");
			final int codigo = producto.getCodigo();
			productoBusiness.delete(codigo);
			assertEquals(productoBusiness.getByCodigo(codigo), null);
		}catch(Exception e){
			e.printStackTrace();
			Assert.fail();
		}
	}
	
	
}


