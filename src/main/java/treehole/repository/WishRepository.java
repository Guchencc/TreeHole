package treehole.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import treehole.entity.Wish;

import java.util.List;

public interface WishRepository {
    @Insert("INSERT INTO wish(userId,wish,videoPath,voicePath,picturePath,createDate,isPublic,isThrown) " +
            "VALUES(#{userId},#{wish},#{videoPath},#{voicePath},#{picturePath},#{createDate},#{isPublic},#{isThrown})")
    void add(Wish wish);

    @Select("SELECT * FROM wish WHERE wishId=#{wishId}")
    Wish findByWishId(int wishId);

    @Select("SELECT * FROM wish WHERE userId=#{userId}")
    List<Wish> findByUserId(int userId);


    @Delete("DELETE FROM wish WHERE wishId=#{wishId}")
    void delete(int wishId);

    @Update("UPDATE wish SET userId=#{userId},wish=#{wish},videoPath=#{videoPath},voicePath=#{voicePath},picturePath=#{picturePath},createDate=#{createDate},isPublic=#{isPublic},isThrown=#{isThrown} WHERE wishId=#{wishId}")
    void update(Wish Wish);
}
