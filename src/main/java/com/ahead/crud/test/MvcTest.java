package com.ahead.crud.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.ahead.crud.pojo.Employee;
import com.github.pagehelper.PageInfo;

@ContextConfiguration(locations= {"classpath:applicationContext.xml","classpath:springmvc.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class MvcTest {
	
	private MockMvc mockMvc; //虚拟mvc请求获取到处理结果
	@Autowired
	private WebApplicationContext context; //传入SpringMVC的IOC
	
	/**
	 * 初始化MockMvc
	 */
	@Before
	public void init() {
		//通过SpringMVC的容器创建MockMvc
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void testPage() throws Exception {
		//模拟发送请求
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/showEmpPageList").param("page", "1"))
							.andReturn();
		MockHttpServletRequest request = result.getRequest();
		PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
		
		System.out.println("当前页数："+pageInfo.getPageNum());
		System.out.println("总页数："+pageInfo.getPages());
		System.out.println("总记录数："+pageInfo.getTotal());
		int[] nums = pageInfo.getNavigatepageNums();
		System.out.println("页码为：");
		for (int i : nums) {
			System.out.print(" "+i);
		}
		System.out.println();
		List<Employee> list = pageInfo.getList();
		for (Employee employee : list) {
			System.out.println("员工的id为："+employee.getEmpId()+" 员工的姓名为："+employee.getEmpName()
						+" 员工的部门为："+employee.getDept().getDeptName());
		}
	}

}
