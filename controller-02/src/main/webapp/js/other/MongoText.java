package com.jk.util;

/*import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

import com.jk.pojo.Student;*/

public class MondText extends BaseTest{

	/*@Autowired
	private MongoTemplate mongoTemplate;
	
	//新增
	@Test
	public void mongtext(){
		Student stud = new Student();
		stud.setName("好好");
		stud.setBrithday("2017-10-10");
		stud.setAge(5);
		mongoTemplate.insert(stud);
	}
	
	//查询
	@Test
	public void mongtext1(){
		List<Student > stu = mongoTemplate.findAll(Student.class);
		System.out.println(stu);
	}
	
	//删除
	
	@Test
	public void mongtext2(){
		Student stud = new Student();
		stud.setId("5a449c5c2c886f11d02db523");
		mongoTemplate.remove(stud);
		Query re = new Query();
		re.skip(0);
		mongoTemplate.remove(re,Student.class);
	}
	
	//修改 
	@Test
	public void mongtext3(){
		Student stud = new Student();
		stud.setId("5a449c5c2c886f11d02db523");
		Update update = new Update();
		update.set("name", "李平");
		update.set("brithday", "2018-01-01");
		update.set("age", 0);
		mongoTemplate.updateMulti(new Query(Criteria.where("id").is(stud.getId())), update, Student.class);
	}*/
}
