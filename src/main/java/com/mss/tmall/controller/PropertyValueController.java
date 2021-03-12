package com.mss.tmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mss.tmall.pojo.Product;
import com.mss.tmall.pojo.PropertyValue;
import com.mss.tmall.service.ProductService;
import com.mss.tmall.service.PropertyService;
import com.mss.tmall.service.PropertyValueService;

import net.sf.jsqlparser.statement.update.Update;

@Controller
@RequestMapping("")
public class PropertyValueController {
	@Autowired
    ProductService productService;
	@Autowired
	PropertyValueService propertyValueService;
	
	@RequestMapping("admin_propertyValue_edit")
	public String edit(Model model,int pid){
		Product p = productService.get(pid);
		propertyValueService.init(p);
		List<PropertyValue> pvs = propertyValueService.list(p.getId());
		
		model.addAttribute("p", p);
        model.addAttribute("pvs", pvs);
        return "admin/editPropertyValue";
	}
	
	@RequestMapping("admin_propertyValue_update")
	public String Update(PropertyValue pv){
		propertyValueService.update(pv);
        return "success";
		
	}
}
