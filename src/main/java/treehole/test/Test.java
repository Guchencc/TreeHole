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

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Test {
    public static void main(String[] args) {
        ApplicationContext context=new ClassPathXmlApplicationContext("/spring/applicationContext-dao.xml");
        SqlSessionFactory sqlSessionFactory=(SqlSessionFactory)context.getBean("sqlSessionFactory");
        SqlSession sqlSession=sqlSessionFactory.openSession();
        WishRepository repository=sqlSession.getMapper(WishRepository.class);
        /*Wish wish =new Wish();
        wish.setUserId(1);
        wish.setWish("我想上清华啊");
        wish.setCreateDate(new Date());
        wish.setPublic(false);
        wish.setThrown(true);
        repository.add(wish);*/
        Wish wish=repository.findByWishId(1);
        wish.setPicturePath("/pictures");
        repository.update(wish);
        System.out.println(repository.findByWishId(wish.getWishId()));
    }
}
