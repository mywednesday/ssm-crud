package com.wednesday.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wednesday.crud.bean.Department;
import com.wednesday.crud.dao.DepartmentMapper;


@Service
public class DepartmentService {
	@Autowired
	DepartmentMapper departmentMapper;

	public List<Department> getAll() {
		return departmentMapper.selectByExample(null);
	}
}
