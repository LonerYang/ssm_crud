package com.ahead.crud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahead.crud.dao.EmployeeMapper;
import com.ahead.crud.pojo.Employee;
import com.ahead.crud.pojo.EmployeeExample;
import com.ahead.crud.pojo.EmployeeExample.Criteria;
import com.ahead.crud.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	EmployeeMapper employeeMapper;	
	@Override
	public List<Employee> getEmpPageList() {
		EmployeeExample example = new EmployeeExample();
		example.setOrderByClause("emp_id asc");
		return employeeMapper.selectByExampleWithDept(example);
	}
	
	@Override
	public void saveEmp(Employee emp) {
		employeeMapper.insertSelective(emp);
	}
	
	/**
	 * @param empName
	 * @return true -> 不存在这个员工代表可用   false -> 存在这个员工代表不可用
	 */
	public boolean isExistEmp(String empName) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(example);
		return count == 0 ? true:false;
	}

	@Override
	public Employee getEmpById(Integer empId) {
		return employeeMapper.selectByPrimaryKey(empId);
	}

	@Override
	public void updateEmp(Employee employee) {
		employeeMapper.updateByPrimaryKeySelective(employee);
	}

	@Override
	public void deleteEmp(List<Integer> ids) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpIdIn(ids);
		employeeMapper.deleteByExample(example);
	}

}
