package com.mss.tmall.service;

import java.util.List;

import com.mss.tmall.pojo.Property;

public interface PropertyService {
	void add(Property c);
	void delete(int id);
	void update(Property c);
	Property get(int id);
	List list(int cid);
}
