package com.mss.tmall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mss.tmall.mapper.PropertyValueMapper;
import com.mss.tmall.pojo.Product;
import com.mss.tmall.pojo.Property;
import com.mss.tmall.pojo.PropertyValue;
import com.mss.tmall.pojo.PropertyValueExample;
import com.mss.tmall.service.PropertyService;
import com.mss.tmall.service.PropertyValueService;

@Service
public class PropertyValueServiceImpl implements PropertyValueService{
	@Autowired
    PropertyValueMapper propertyValueMapper;
 
    @Autowired
    PropertyService propertyService;
 
	
	@Override
	public void init(Product p){
		List<Property> pts =  propertyService.list(p.getCid());
		for (Property pt : pts) {
			PropertyValue pv = get(p.getId(), p.getId());
			if(pv==null){
				pv = new PropertyValue();
				pv.setPid(p.getId());
				pv.setPtid(pt.getId());
				propertyValueMapper.insert(pv);
			}
		}
	}
	
	@Override
	public void update(PropertyValue pv){
		propertyValueMapper.updateByPrimaryKeySelective(pv);
	}
	
	@Override
	public PropertyValue get(int ptid,int pid){
		PropertyValueExample example = new PropertyValueExample();
        example.createCriteria().andPtidEqualTo(ptid).andPidEqualTo(pid);
        List<PropertyValue> pvs= propertyValueMapper.selectByExample(example);
        if (pvs.isEmpty())
            return null;
        return pvs.get(0);
	}
	
	@Override
    public List<PropertyValue> list(int pid) {
        PropertyValueExample example = new PropertyValueExample();
        example.createCriteria().andPidEqualTo(pid);
        List<PropertyValue> result = propertyValueMapper.selectByExample(example);
        for (PropertyValue pv : result) {
            Property property = propertyService.get(pv.getPtid());
            pv.setProperty(property);
        }
        return result;
    }
}
