package com.ahead.crud.service;

import java.util.List;

import com.ahead.crud.pojo.Department;

public interface DepartmentService {
	
	/**
	 * 获得所有的部门信息
	 * @return
	 */
	public List<Department> getDepts();

}
