package treehole.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import treehole.entity.BottleProfile;
import treehole.entity.Bulletin;

import java.util.List;

public interface BottleProfileRepository {
    @Insert("INSERT INTO bottle_profile(profilePicture,nickname,gender,signature) VALUES (#{profilePicture},#{nickname},#{gender},#{signature})")
    void add(BottleProfile bottleProfile);

    @Select("SELECT * FROM bottle_profile WHERE userId=#{userId}")
    BottleProfile findByUserId(int userId);

    @Select("SELECT * FROM bottle_profile")
    List<BottleProfile> findAll();

    @Delete("DELETE FROM bottle_profile WHERE userId=#{userId}")
    void delete(int userId);

    @Update("UPDATE bottle_profile SET profilePicture=#{profilePicture},nickname=#{nickname},gender=#{gender},signature=#{signature}")
    void update(BottleProfile bottleProfile);
}
