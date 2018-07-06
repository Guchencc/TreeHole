package treehole.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import treehole.entity.DriftingBottle;
import treehole.entity.User;
import treehole.model.BottleInfo;

import java.util.List;

public interface DriftingBottleRepository {
    @Insert("INSERT INTO drifting_bottle(wishId,userId,throwDate,pickedUsers,pickCount) VALUES (#{wishId},#{userId},#{throwDate},#{pickedUsers},#{pickCount})")
    void add(DriftingBottle driftingBottle);

    @Select("SELECT * FROM drifting_bottle WHERE bottleId=#{bottleId}")
    DriftingBottle findById(int bottleId);

    @Select("SELECT * FROM drifting_bottle WHERE userId=#{userId}")
    List<DriftingBottle> findAll(int userId);

    @Select("SELECT a.bottleId,a.wishId,a.throwDate,b.wish,b.hasPicture,b.hasVideo,b.hasVoice,a.isAnonymous FROM drifting_bottle a,wish b  WHERE a.userId=#{userId} AND a.wishId=b.wishId ORDER BY a.throwDate DESC")
    List<BottleInfo> findUserThrownBottle(int userId);

    @Select("SELECT a.bottleId,a.wishId,a.userId,c.nickname,a.throwDate,b.wish,b.hasPicture,b.hasVideo,b.hasVoice,a.isAnonymous FROM drifting_bottle a,wish b,user c  WHERE find_in_set(#{userId},a.pickedUsers)>0 AND a.wishId=b.wishId AND a.userId=c.userId ORDER BY a.throwDate DESC")
    List<BottleInfo> findUserPickedBottle(int userId);

    @Select("SELECT a.bottleId,a.wishId,a.userId,c.nickname,a.throwDate,b.wish,b.hasPicture,b.hasVideo,b.hasVoice,a.isAnonymous FROM drifting_bottle a,wish b,user c  WHERE  a.wishId=b.wishId AND a.userId=c.userId AND a.bottleId=#{bottleId}")
    BottleInfo findBottleInfo(int bottleId);

    @Update("UPDATE drifting_bottle SET wishId=#{wishId},userId=#{userId}, throwDate=#{throwDate},pickedUsers=#{pickedUsers},pickCount=#{pickCount} WHERE bottleId=#{bottleId}")
    void update(DriftingBottle driftingBottle);

    @Delete("DELETE FROM drifting_bottle WHERE bottleId=#{bottleId}")
    void delete(int bottleId);

    @Select("SELECT bottleId FROM drifting_bottle WHERE wishId=#{wishId}")
    int findBottleByWishId(int wishId);
}
