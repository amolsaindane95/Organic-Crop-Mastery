package com.organiccropmastery.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.organiccropmastery.model.Product;
import com.organiccropmastery.resource.ProductResource;

@Controller
@MultipartConfig
public class ProductController {
	
	@Autowired
	private ProductResource productResource;
	
	@PostMapping("/addproduct")
	public ModelAndView addProduct(HttpServletRequest request, HttpSession session) throws IOException, ServletException {
		ModelAndView mv = new ModelAndView();
		
		String productTitle=request.getParameter("productTitle");
		String productDescription=request.getParameter("productDescription");
		Double productPrice=Double.parseDouble(request.getParameter("productPrice"));
		int productQuantity=Integer.parseInt(request.getParameter("productQuantity"));
		Double productDiscount=Double.parseDouble(request.getParameter("productDiscount"));
		int productCategoryId=Integer.parseInt(request.getParameter("productCategoryId"));
		Part part=request.getPart("productPic");	
		
		String fileName=part.getSubmittedFileName();
		
		String uploadPath="C:\\Users\\admin\\Downloads\\MyProject\\organic-crop-mastery\\src\\main\\webapp\\resources\\productpic\\"+fileName;
		
		try
		{
		FileOutputStream fos=new FileOutputStream(uploadPath);
		InputStream is=part.getInputStream();
		
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		Product product = new Product();
		product.setCategoryId(productCategoryId);
		product.setImagePath(fileName);
		product.setName(productTitle);
		product.setPrice(productPrice);
		product.setDiscount(productDiscount);
	    product.setQuantity(productQuantity);
	    product.setDescription(productDescription);
	    
		product =productResource.addProduct(product);
		
		if(product != null )
	    {
			mv.addObject("status", "Product Added Successfully.");
	    }
	    
	   else
	    {
		   mv.addObject("status", "Failed to add product.");
	    }
		mv.setViewName("index");
		
		return mv;
	}
	
	@PostMapping("/updateproduct")
	public ModelAndView updateProduct(HttpServletRequest request, HttpSession session) throws IOException, ServletException {
		ModelAndView mv = new ModelAndView();
		
		Product product = productResource.getProductById(Integer.parseInt(request.getParameter("productId")));
		
		String productTitle=request.getParameter("productTitle");
		String productDescription=request.getParameter("productDescription");
		Double productPrice=Double.parseDouble(request.getParameter("productPrice"));
		int productQuantity=Integer.parseInt(request.getParameter("productQuantity"));
		Double productDiscount=Double.parseDouble(request.getParameter("productDiscount"));
		Part part=request.getPart("productPic");	
		
		String fileName=part.getSubmittedFileName();
		
		String uploadPath="C:\\Users\\admin\\Downloads\\MyProject\\organic-crop-mastery\\src\\main\\webapp\\resources\\productpic\\"+fileName;
		
		try
		{
		FileOutputStream fos=new FileOutputStream(uploadPath);
		InputStream is=part.getInputStream();
		
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	 
		product.setImagePath(fileName);
 		product.setName(productTitle);
		product.setPrice(productPrice);
		product.setDiscount(productDiscount);
	    product.setQuantity(productQuantity);
	    product.setDescription(productDescription);
	    
		product =productResource.updateProduct(product);
		
		if(product != null )
	    {
			mv.addObject("status", "Product updated Successfully.");
	    }
	    
	   else
	    {
		   mv.addObject("status", "Failed to update product.");
	    }
		mv.setViewName("index");
		
		return mv;
	}
	
	@PostMapping("/searchproduct")
	public ModelAndView searchProductByName(@RequestParam("productname") String productName) throws IOException, ServletException 
	{
		ModelAndView mv = new ModelAndView();
		List<Product> products = new ArrayList<>();
		products = productResource.searchProductsByName(productName);
		if(products.isEmpty())
		{
			mv.addObject("status"," No Oopss !!! No Product Found. You can try following...");
			mv.setViewName("index");
		}
		else
		{
			mv.addObject("sentFromOtherSource","yes");
			mv.addObject("products", products);
			mv.setViewName("index");
		}
			
		
		
		return mv;
	}
	
	@GetMapping("/product")
	public ModelAndView product(@RequestParam("productId") String productId) {
		ModelAndView mv = new ModelAndView();
		   
		mv.addObject("productId",productId);
		mv.setViewName("product");
		
		return mv;
	}
	
	@GetMapping("/deleteproduct")
	public ModelAndView deleteProduct(@RequestParam("productId") int productId) {
		
		productResource.deleteProductById(productId);
		
		ModelAndView mv = new ModelAndView();
		   
		mv.addObject("status","Product deleted successfully");
		mv.setViewName("index");
		
		return mv;
		
	}
	
}
