package treehole.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import treehole.entity.Follow;
import treehole.entity.Pick;
import treehole.entity.User;
import treehole.model.FollowInfo;

import java.util.List;

public interface FollowRepository {
    @Insert("INSERT INTO follow(userId,followId,isSpecialFollow,followDate) VALUES (#{userId},#{followId},#{isSpecialFollow},#{followDate})")
    void add(Follow follow);

    @Select("SELECT * FROM follow WHERE userId=#{0} AND followId=#{1}")
    Follow find(int userId,int followId);

    @Select("SELECT * FROM follow WHERE userId=#{userId}")
    List<Follow> findByUserId(int userId);

    @Select("SELECT * FROM follow WHERE userId=#{userId} AND isSpecialFollow=true")
    List<Follow> findSpecialFollow(int userId);

    @Delete("DELETE FROM follow WHERE userId=#{0} AND followId=#{1}")
    void delete(int userId,int followId);

    @Update("UPDATE follow SET userId=#{userId},followId=#{followId},isSpecialFollow=#{isSpecialFollow},followDate=#{followDate} WHERE userId=#{userId} AND followId=#{followId}")
    void update(Follow follow);

    @Select("SELECT count(*) FROM follow")
    int getPageCount();


    @Select("SELECT * FROM follow LIMIT #{0},#{1}")
    List<Follow> findPage(int startRow,int pageSize);

    @Select("SELECT b.userId,a.username,b.followId,c.username AS followUserName,b.followDate,b.isSpecialFollow FROM user a,follow b,user c WHERE b.userId=a.userId AND b.followId=c.userId AND b.userId=#{userId}")
    List<FollowInfo> getFollowInfo(int userId);
    @Select("SELECT b.userId,a.username,b.followId,c.username AS followUserName,b.followDate,b.isSpecialFollow FROM user a,follow b,user c WHERE b.userId=a.userId AND b.followId=c.userId AND b.userId=1 AND b.isSpecialFollow=TRUE")
    List<FollowInfo> getSpecialFollowInfo(int userId);
}
