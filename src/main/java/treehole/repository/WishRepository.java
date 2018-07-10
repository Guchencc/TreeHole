package treehole.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import treehole.entity.Secret;
import treehole.entity.Wish;
import treehole.model.WishInfo;

import java.util.List;

public interface WishRepository {
    @Insert("INSERT INTO wish(userId,wish,hasVideo,hasVoice,hasPicture,createDate,isPrivacy,isThrown) " +
            "VALUES(#{userId},#{wish},#{hasVideo},#{hasVoice},#{hasPicture},#{createDate},#{isPrivacy},#{isThrown})")
    void add(Wish wish);

    @Select("SELECT * FROM wish WHERE wishId=#{wishId}")
    Wish findByWishId(int wishId);

    @Select("SELECT * FROM wish WHERE userId=#{userId} ORDER BY createDate DESC")
    List<Wish> findByUserId(int userId);

    @Delete("DELETE FROM wish WHERE wishId=#{wishId}")
    void delete(int wishId);

    @Update("UPDATE wish SET userId=#{userId},wish=#{wish},hasVideo=#{hasVideo},hasVoice=#{hasVoice},hasPicture=#{hasPicture},isPrivacy=#{isPrivacy},isThrown=#{isThrown} WHERE wishId=#{wishId}")
    void update(Wish Wish);

    @Select("SELECT count(*) FROM wish")
    int getPageCount();

    @Select("SELECT * FROM wish LIMIT #{0},#{1}")
    List<Wish> findPage(int startRow, int pageSize);

    @Select("SELECT * FROM wish WHERE userId=#{userId} AND isPrivacy=false")
    List<Wish> findPublicByUserId(int userId);

    @Select("SELECT * FROM wish WHERE userId=#{2} AND isPrivacy=false ORDER BY createDate DESC LIMIT #{0},#{1}" )
    List<WishInfo> findPublicWishPageByUserId(int startIndex, int pageSize, int userId);
}
