package treehole.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import treehole.entity.DriftingBottle;
import treehole.entity.User;

import java.util.List;

public interface DriftingBottleRepository {
    @Insert("INSERT INTO drifting_bottle(wishId,userId,throwDate,pickedUsers,pickCount) VALUES (#{wishId},#{userId},#{throwDate},#{pickedUsers},#{pickCount})")
    void add(DriftingBottle driftingBottle);

    @Select("SELECT * FROM drifting_bottle WHERE bottleId=#{bottleId}")
    DriftingBottle findById(int bottleId);

    @Select("SELECT * FROM drifting_bottle WHERE userId=#{userId}")
    List<DriftingBottle> findAll(int userId);

    @Update("UPDATE drifting_bottle SET wishId=#{wishId},userId=#{userId}, throwDate=#{throwDate},pickedUsers=#{pickedUsers},pickCount=#{pickCount} WHERE bottleId=#{bottleId}")
    void update(DriftingBottle driftingBottle);

    @Delete("DELETE FROM drifting_bottle WHERE bottleId=#{bottleId}")
    void delete(int bottleId);
}
