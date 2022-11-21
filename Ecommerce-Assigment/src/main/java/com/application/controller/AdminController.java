package com.application.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.application.dto.ProductDto;
import com.application.dto.ResponseStatus;
import com.application.entity.Product;
import com.application.service.ProductService;
import com.application.util.ImageUploader;


@Controller
public class AdminController {
	
	private static final String SUCCESS="SUCCESS";
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ImageUploader imageUploader;
	
	@Value("${upload.image}")
	private String path;
	
	@RequestMapping("/adminpage")
	public String adminLogin(Model m,HttpSession session) {
		if(session.getAttribute("adminuser")==null) {
			return "login";
		}
		List<Product> products=this.productService.getAllProduct();
		m.addAttribute("products",products);
		return "adminpage";
	}
	
	@PostMapping("/addproduct")
	public @ResponseBody ResponseStatus<String> addProduct(@ModelAttribute ProductDto dto)
	{
		String filename=this.imageUploader.uploadImage(path, dto.getImage());
		dto.setImg(filename);
		this.productService.insertProduct(dto);
		return new ResponseStatus<>(200,SUCCESS);
		
	}
	
	@PostMapping("/getproductbyid")
	public @ResponseBody ResponseStatus<Product> getProductById(@RequestBody String pid){
		JSONObject orderJson = new JSONObject(pid);
		int prodId=orderJson.getInt("productId");	
		Product product=this.productService.getProductById(prodId);
		return new ResponseStatus<>(200, product);
	
	}
	
	@PostMapping("/serviceurl")
	public @ResponseBody ResponseStatus<String> excelupload(MultipartFile file){
		
		try {
			HSSFWorkbook workbook = new HSSFWorkbook(file.getInputStream());
			HSSFSheet sheet = workbook.getSheetAt(0);
			
			for(int i=1; i<sheet.getPhysicalNumberOfRows();i++) {
				HSSFRow row = sheet.getRow(i);
			
				for(int j=0;j<row.getPhysicalNumberOfCells();) {
//					row.getCell(j).setCellType(CellType.STRING);		
					 ProductDto p=new ProductDto();
					  p.setName(row.getCell(j).toString());
					  p.setDescription(row.getCell(j+1).toString());
					 p.setPrice(Double.parseDouble(row.getCell(j+3).toString()));
					 double d=(row.getCell(j+2).getNumericCellValue());
					Double d1=Double.valueOf(d);
					p.setQuantity(d1.intValue());
					 p.setImg(row.getCell(j+4).toString()); 
					 this.productService.insertProduct(p);
					 break;

				}
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return new ResponseStatus<>(200,SUCCESS);
	}
	
	@PostMapping("/deleteproductbyid")
	public @ResponseBody ResponseStatus<String> deleteProductById(@RequestBody String pid){
		JSONObject orderJson = new JSONObject(pid);
		int prodId=orderJson.getInt("productId");	
		if(this.productService.deleteProductById(prodId))
			return new ResponseStatus<>(200,SUCCESS);
		return new ResponseStatus<>(401,"faild");
	}
	
	@PostMapping("/updateproduct")
	public @ResponseBody ResponseStatus<String> updateProduct(@ModelAttribute ProductDto dto)
	{
		this.imageUploader.setId(dto.getpId());
		String filename=this.imageUploader.uploadImage(path, dto.getImage());
		dto.setImg(filename);
		this.productService.updateProduct(dto);
		return new ResponseStatus<>(200,SUCCESS);
	}

}
