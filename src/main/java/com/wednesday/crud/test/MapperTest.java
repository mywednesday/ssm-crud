package com.wednesday.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wednesday.crud.bean.Department;
import com.wednesday.crud.bean.Employee;
import com.wednesday.crud.dao.DepartmentMapper;
import com.wednesday.crud.dao.EmployeeMapper;

/**
 *   ����dao��Ĺ���
 * @author Administrator
 *  1. ����SpringTestģ�飬 SpringTest��spring��junit�Ļ����ϵ���һ�η�װ
 *  2. ��@ContextConfigurationָ��Spring�����ļ���λ��
 */

/**
 * https://blog.csdn.net/love_everybody/article/details/79836136
 * �����Զ�װ��Ĺ���Ҳ����������ע�룬Ҳ�п��Ʒ�ת�� ����ע�룺�������Ķ�������������ע�롢װ�䡣
 * ���Ʒ�ת������ʵ�����Ŀ���Ȩ��ʹ����ת�Ƶ��������� IOC�ı���������ע�루DI��
 * 
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {

	@Autowired
	DepartmentMapper departmentMapper;

	@Autowired
	EmployeeMapper employeeMapper;

	@Autowired
	SqlSession sqlSession;

	@Test
	public void textCRUD() {
//		ʹ�� @Autowired �Զ�װ��DepartmentMapper������
//		// ����SpringIOC����
//		ApplicationContext ioc = new ClassPathXmlApplicationContext();
//		// �������л�ȡmapper
//		DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);

		System.out.println(departmentMapper);

		// 1
//		departmentMapper.insertSelective(new Department(null, "开发部"));
//		departmentMapper.insertSelective(new Department(null, "测试部"));
//		departmentMapper.insertSelective(new Department(null, "管理部"));

		// 2
//		employeeMapper.insertSelective(new Employee(null, "Jerry", "M", "Jerry@163.com", 1));
		
		// 3 批量插入多个员工
		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		for (int i = 0; i < 1000; i++) {
			String uuidString = UUID.randomUUID().toString().substring(0, 5) + i;
			mapper.insertSelective(new Employee(null, uuidString, "M", uuidString + "@163.com", 1));
		}

		System.out.println("批量完成");
	}
}
