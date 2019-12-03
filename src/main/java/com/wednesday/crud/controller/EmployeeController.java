package com.wednesday.crud.controller;


import java.io.Console;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wednesday.crud.bean.Employee;
import com.wednesday.crud.bean.Msg;
import com.wednesday.crud.service.EmployeeService;

/*
 *  处理员工CRUD请求
*/


@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;

	
	@RequestMapping(value="/emps",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(Employee employee) {
		employeeService.save(employee);
		return Msg.success();
	}
	
	
	@RequestMapping(value="/emps/{empId}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteEmp(@PathVariable("empId")Integer empId) {
		System.out.print("empId = " + empId);
		int result = employeeService.delete(empId);
		System.out.print("deleteEmp" + result);
		return Msg.success();
	}
	
	
	@RequestMapping(value="/emps",method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateEmp(Employee employee) {
		employeeService.update(employee);
		return Msg.success();
	}
	
	
	/*
	 * @ResponseBody 正常工作需要 jackson包的支持
	*/
	@RequestMapping(value="/emps",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmpsWithJSON(@RequestParam(value="pn", defaultValue = "1")Integer pn, Model model) {
		PageHelper.startPage(pn, 5);
		// startPage后紧跟的查询就是分页查询
		List<Employee> emps = employeeService.getAll();
		
		//使用PageInfo包装查询后的结果, 只需要将pageInfo交给页面就行了，其封装了详细的分页信息，包括我们查询出来的数据
		// 传入连续显示的页数 5
		PageInfo<Employee> pageInfo = new PageInfo<Employee>(emps, 5);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
//	@RequestMapping("/emps") 
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
