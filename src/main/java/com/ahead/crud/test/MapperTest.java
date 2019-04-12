package com.ahead.crud.test;

import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ahead.crud.dao.DepartmentMapper;
import com.ahead.crud.dao.EmployeeMapper;
import com.ahead.crud.pojo.Department;
import com.ahead.crud.pojo.Employee;
import com.ahead.crud.pojo.EmployeeExample;
import com.ahead.crud.pojo.EmployeeExample.Criteria;

@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class MapperTest {
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmployeeMapper employeeMapper;
	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void testCRUD() {
//		departmentMapper.insertSelective(new Department(null, "测试部"));
//		departmentMapper.insertSelective(new Department(null, "开发部"));
//		employeeMapper.insertSelective(new Employee(null, "Yang", "M", "yang@163.com", 2));
		
		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		for(int i = 0;i < 1000; i++) {
			String uid = UUID.randomUUID().toString().substring(0, 5)+i;
			mapper.insertSelective(new Employee(null, uid, "M", uid+"@163.com", 1));
		}
		System.out.println("插入1000条成功");
		
//		EmployeeExample example = new EmployeeExample();
//		//在底层自己创建了一个查询对象
//		Criteria criteria = example.createCriteria();
//		criteria.andEmpIdEqualTo(1);
//		//在SQL映射文件中会把example中的查询对象集合中的条件拿出来
//		List<Employee> list = employeeMapper.selectByExampleWithDept(example);
//		System.out.println(list.get(0));
		
		Employee emp = employeeMapper.selectByPrimaryKeyWithDept(2);
		System.out.println(emp);
	}

}
