package treehole.test;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import treehole.entity.User;
import treehole.model.PageBean;
import treehole.repository.FollowRepository;
import treehole.repository.UserRepository;

import java.util.List;

public class Test {
    public static void main(String[] args) {
        ApplicationContext context=new ClassPathXmlApplicationContext("/spring/applicationContext-dao.xml");
        SqlSessionFactory sqlSessionFactory=(SqlSessionFactory)context.getBean("sqlSessionFactory");
        SqlSession sqlSession=sqlSessionFactory.openSession();
        UserRepository repository=sqlSession.getMapper(UserRepository.class);
        List<User> users= repository.findAll();
        PageBean<User> pageBean=new PageBean<>(1,6,users.size());
        System.out.println(pageBean);
        PageBean bean=new PageBean(5,2,9);

    }
}
