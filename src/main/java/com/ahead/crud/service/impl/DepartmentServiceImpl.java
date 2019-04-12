package com.ahead.crud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahead.crud.dao.DepartmentMapper;
import com.ahead.crud.pojo.Department;
import com.ahead.crud.service.DepartmentService;

@Service
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentMapper departmentMapper;
	
	@Override
	public List<Department> getDepts() {
		
		return departmentMapper.selectByExample(null);
	}

}
