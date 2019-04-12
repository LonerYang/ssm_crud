package com.ahead.crud.dao;

import com.ahead.crud.pojo.Department;
import com.ahead.crud.pojo.DepartmentExample;
import com.ahead.crud.pojo.Employee;
import com.ahead.crud.pojo.EmployeeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmployeeMapper {
    long countByExample(EmployeeExample example);

    int deleteByExample(EmployeeExample example);

    int deleteByPrimaryKey(Integer empId);

    int insert(Employee record);

    int insertSelective(Employee record);

    List<Employee> selectByExample(EmployeeExample example);

    Employee selectByPrimaryKey(Integer empId);
    
    /**
     * 根据条件获取员工和部门信息
     * @param example
     * @return
     */
    List<Employee> selectByExampleWithDept(EmployeeExample example);

    /**
     * 根据主键获取员工和部门信息
     * @param deptId
     * @return
     */
    Employee selectByPrimaryKeyWithDept(Integer deptId);
    
    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
}