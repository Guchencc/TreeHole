package treehole.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import treehole.entity.User;

import java.util.List;

public interface UserRepository {

    @Insert("INSERT INTO user(username,password,nickname,gender,birthday,email,createDate,profilePicture) VALUES (#{username},#{password},#{nickname},#{gender},#{birthday},#{email},#{createDate},#{profilePicture})")
    void add(User user);

    @Select("SELECT * FROM user WHERE userId=#{userId}")
    User findById(int userId);

    @Select("SELECT * FROM user WHERE username=#{username}")
    User findByUserName(String username);

    @Select("SELECT * FROM user WHERE nickname=#{nickname}")
    User findByNickName(String nickname);

    @Select("SELECT * FROM user")
    List<User> findAll();

    @Update("UPDATE user SET username=#{username},password=#{password},nickname=#{nickname}, gender=#{gender},birthday=#{birthday},email=#{email},profilePicture=#{profilePicture} WHERE userId=#{userId}")
    void update(User user);

    @Delete("DELETE FROM user WHERE userId=#{userId}")
    void delete(int userId);
}