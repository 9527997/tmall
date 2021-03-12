package com.mss.tmall.service;

import java.util.List;

import com.mss.tmall.pojo.Product;
import com.mss.tmall.pojo.PropertyValue;

public interface PropertyValueService {
	 void init(Product p);
	 void update(PropertyValue pv);
	 
	 PropertyValue get(int ptid,int pid);
	 List<PropertyValue> list(int pid);
}
