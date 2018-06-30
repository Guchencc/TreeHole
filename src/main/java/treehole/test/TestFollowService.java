package treehole.test;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import treehole.entity.Follow;
import treehole.repository.FollowRepository;
import treehole.repository.UserRepository;
import treehole.service.FollowService;
import treehole.service.UserService;

public class TestFollowService {
    private static FollowService followService;

    public static void main(String[] args) {
        ApplicationContext context=new ClassPathXmlApplicationContext("/spring/applicationContext-dao.xml");
        SqlSessionFactory sqlSessionFactory=(SqlSessionFactory)context.getBean("sqlSessionFactory");
        SqlSession sqlSession=sqlSessionFactory.openSession();
        FollowRepository repository=sqlSession.getMapper(FollowRepository.class);
        followService=new FollowService(repository);
        testGetSpecialFollows();
    }

    static void testAddFollow(){
        followService.addFollow(1,41);
    }

    static void testSpecialFollow(){
        followService.setSpecialFollow(1,41);
    }
    static void testCancelSpecialFollow(){
        followService.cancelSpecialFollow(1,41);
    }
    static void testDeleteFollow() {
        followService.stopFollow(1,41);
    }
    static void testGetFollows() {
        System.out.println(followService.getFollows(1));
    }
    static void testGetSpecialFollows() {
        System.out.println(followService.getSpecialFollows(1));
    }
}
