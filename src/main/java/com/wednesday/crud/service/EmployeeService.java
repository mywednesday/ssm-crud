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

	public List<Employee> getAll() {
		return employeeMapper.selectByExampleWithDept(null);
	}
}
