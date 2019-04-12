package com.ahead.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ahead.crud.pojo.Employee;
import com.ahead.crud.pojo.Msg;
import com.ahead.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;
	
	/**
	 * 单个或批量删除员工  格式1-2-3
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteEmp/{ids}",method = RequestMethod.DELETE)
	public Msg deleteEmp(@PathVariable("ids")String ids) {
		List<Integer> idList = new ArrayList<Integer>();
		
		if(ids.contains("-")) {
			//如果包含 - 说明是批量删除
			String[] idsStr = ids.split("-");
			for (String idStr : idsStr) {
				idList.add(Integer.parseInt(idStr));
			}
			employeeService.deleteEmp(idList);
		} else {
			//不包含就是单个删除
			idList.add(Integer.parseInt(ids));
			employeeService.deleteEmp(idList);
		}
		return Msg.success();
	}
	
	
	/**
	 *     如果ajax请求的方式是PUT，就获取不到请求体中的数据,
	 * tomcat源码中默认只会解析POST请求方式的请求体中的数据
	 * 这时候需要配置拦截器，让HttpPutFormContentFilter拦截器来帮我们包装request，并在包装类中重写了getParameter方法
	 * @param emp
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/updateEmp/{empId}",method = RequestMethod.PUT)
	public Msg updateEmp(Employee emp) {
		employeeService.updateEmp(emp);
		return Msg.success();
	}
	
	/**
	 * 回显员工
	 * @param empId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/echoEmp/{id}")
	public Msg echoEmp(@PathVariable("id")Integer empId) {
		Employee emp = employeeService.getEmpById(empId);
		return Msg.success().add("emp", emp);
	}
	
	@ResponseBody
	@RequestMapping("/isExistEmp")
	public Msg isExistEmp(String empName) {
		
		String regex = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		if(!empName.matches(regex)) {
			return Msg.fail().add("error", "姓名为6-16位的英文字母数字组合或者2-5位的中文");
		}
		boolean isExist = employeeService.isExistEmp(empName);
		if(isExist) {
			return Msg.success();
		} else {
			return Msg.fail().add("error", "用户名已存在");
		}
	}
	
	@RequestMapping(value="/saveEmp",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee emp,BindingResult result) {
		Map<String,Object> map = new HashMap<String,Object>();
		if(result.hasErrors()) {
			//获得所有字段上的异常信息
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError error : errors) {
				map.put(error.getField(), error.getDefaultMessage());
			}
			return Msg.fail().add("endError", map);
		} else {
			employeeService.saveEmp(emp);
			return Msg.success();
		}
		
		
	}
	
	/**
	 * 显示分页数据
	 * @param page
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/showEmpPageList")
	public Msg showEmpPageListWithJson(@RequestParam(value="page",defaultValue="1")Integer page) {
		PageHelper.startPage(page, 5);
		List<Employee> empPageList = employeeService.getEmpPageList();
		//这个5是代表显示几个页码
		PageInfo pageInfo = new PageInfo(empPageList,5);
		
		return Msg.success().add("pageInfo",pageInfo);
	}
	
	
	//@RequestMapping("/showEmpPageList")
	public String showEmpPageList(@RequestParam(value="page",defaultValue="1")Integer page,Model model) {
		
		PageHelper.startPage(page, 5);
		List<Employee> empPageList = employeeService.getEmpPageList();
		//这个5是代表显示几个页码
		PageInfo pageInfo = new PageInfo(empPageList,5);
		model.addAttribute("pageInfo", pageInfo);
		
		return "list";
	}
}
