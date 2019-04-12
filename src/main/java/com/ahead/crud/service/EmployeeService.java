package com.ahead.crud.service;

import java.util.List;

import com.ahead.crud.pojo.Employee;

public interface EmployeeService {

	/**
	 * 查询分页信息
	 * @return
	 */
	public List<Employee> getEmpPageList();
	
	/**
	 * 保存员工
	 * @param emp
	 */
	public void saveEmp(Employee emp);
	
	/**
	 * 根据员工姓名查找是否有该员工
	 * @param empName
	 * @return
	 */
	public boolean isExistEmp(String empName); 
	
	/**
	 * 根据主键获取员工信息
	 * @param empId
	 * @return
	 */
	public Employee getEmpById(Integer empId);
	
	/**
	 * 修改员工
	 * @param employee
	 */
	public void updateEmp(Employee employee);
	
	/**
	 * 单个删除或批量删除
	 * @param ids
	 */
	public void deleteEmp(List<Integer> ids);
}
