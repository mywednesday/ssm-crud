package com.wednesday.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wednesday.crud.bean.Employee;
import com.wednesday.crud.dao.EmployeeMapper;

@Service
public class EmployeeService {
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	public int save(Employee employee) {
		return employeeMapper.insertSelective(employee);
	}
	
	public int delete(Integer empId) {
		return employeeMapper.deleteByPrimaryKey(empId);
	}
	
	public int update(Employee employee) {
		return employeeMapper.updateByPrimaryKey(employee);
	}

	public List<Employee> getAll() {
		return employeeMapper.selectByExampleWithDept(null);
	}
}
