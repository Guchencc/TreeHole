package treehole.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import treehole.entity.Pick;
import treehole.entity.Wish;

import java.util.List;

public interface PickRepository {
    @Insert("INSERT INTO pick(userId,bottleId,pickDate) VALUES (#{userId},#{bottleId},#{pickDate})")
    void add(Pick pick);

    @Select("SELECT * FROM pick WHERE userId=#{userId}")
    List<Pick> findByUserId(int userId);

    @Select("SELECT * FROM pick WHERE bottleId=#{bottleId}")
    List<Pick> findByBottleId(int bottleId);


    @Delete("DELETE FROM pick WHERE userId=#{userId} AND bottleId=#{bottleId}")
    void delete(int userId,int bottleId);

    @Update("UPDATE pick SET userId=#{userId},bottleId=#{bottleId} WHERE userId=#{userId},bottleId=#{bottleId}")
    void update(Pick pick);


}
