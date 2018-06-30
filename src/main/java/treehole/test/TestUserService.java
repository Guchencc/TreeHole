package treehole.test;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import treehole.entity.Secret;
import treehole.entity.User;
import treehole.entity.Wish;
import treehole.repository.SecretRepository;
import treehole.repository.UserRepository;
import treehole.repository.WishRepository;
import treehole.service.UserService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class TestUserService {
    public static void main(String[] args) {
        ApplicationContext context=new ClassPathXmlApplicationContext("/spring/applicationContext-dao.xml");
        SqlSessionFactory sqlSessionFactory=(SqlSessionFactory)context.getBean("sqlSessionFactory");
        SqlSession sqlSession=sqlSessionFactory.openSession();
        UserRepository repository=sqlSession.getMapper(UserRepository.class);
        UserService userService=new UserService(repository);
        testGetProfile(userService);
    }

    static void testRegister(UserService userService){
        User user=new User();
        user.setUsername("dadaf");
        user.setPassword("fafaf");
        user.setNickname("陈佳文");
        user.setCreateDate(new Date());
        user.setEmail("7777777@qq.com");
        user.setGender(1);
        user.setBirthday(new Date());
        userService.register(user);
    }

    static void testUpdate(UserService userService){
        User user=userService.getProfile(41);
        user.setGender(0);
        user.setEmail("888@qq.com");
        user.setBirthday(new Date());
        userService.updateProfile(user);
    }

    static void testGetProfile(UserService userService){
        System.out.println( userService.getProfile(1));
    }
}
