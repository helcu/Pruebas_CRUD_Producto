package com.upc.edu.business;

import java.io.IOException;
import java.util.List;

import com.upc.edu.dao.ProductoDAO;
import com.upc.edu.entity.Producto;

public class ProductoBusiness {
	
	ProductoDAO productoDao = ProductoDAO.getInstance();
	
	public void add(final Producto producto) throws IOException {
		productoDao.add(producto);		
	}
	
	public void update(final Producto producto) throws IOException {
		productoDao.update(producto);
	}
	
	public void delete(final int id) throws IOException {
		productoDao.delete(id);
	}
	
	public Producto getByCodigo(final int id) throws IOException {
		return productoDao.getByCodigo(id);
	}
	
	public List<Producto> getProductos() throws IOException {
		return productoDao.getProductos();
	}
	
	public List<Producto> getProductosByInfo(final String productoInfo) throws IOException { 
		return productoDao.getProductosByInfo(productoInfo);
	}
	
}
