package com.wednesday.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wednesday.crud.bean.Employee;
import com.wednesday.crud.service.EmployeeService;

/*
 *  处理员工CRUD请求
*/


@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;
	
	
	@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pn", defaultValue = "1")Integer pn, Model model) {
		/*
		 * PageHelper 分页插件的使用很简单，只需要在查询之前调用：
		*/
		
		
		PageHelper.startPage(pn, 5);
		// startPage后紧跟的查询就是分页查询
		List<Employee> emps = employeeService.getAll();
		
		//使用PageInfo包装查询后的结果, 只需要将pageInfo交给页面就行了，其封装了详细的分页信息，包括我们查询出来的数据
		// 传入连续显示的页数 5
		PageInfo pageInfo = new PageInfo(emps, 5);
		model.addAttribute("pageInfo", pageInfo);
		
		
		return "list";
	}
}
