package treehole.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import treehole.entity.BottleMessage;
import treehole.entity.BottleProfile;
import treehole.model.BottleMessageInfo;

import java.util.List;

public interface BottleMessageRepository {
    @Insert("INSERT INTO bottle_message(bottleId,userId,message,writeDate,isAnonymous) VALUES (#{bottleId},#{userId},#{message},#{writeDate},#{isAnonymous})")
    void add(BottleMessage bottleMessage);

    @Select("SELECT * FROM bottle_message WHERE messageId=#{messageId}")
    BottleMessage findByMessageId(int messageId);

    @Select("SELECT * FROM bottle_message WHERE bottleId=#{bottleId}")
    List<BottleMessage> findByBottleId(int bottleId);

    @Select("SELECT * FROM bottle_message WHERE userId=#{userId}")
    List<BottleMessage> findByUserId(int userId);

    @Delete("DELETE FROM bottle_message WHERE messageId=#{messageId}")
    void delete(int messageId);

    @Update("UPDATE bottle_message SET bottleId=#{bottleId},userId=#{userId},message=#{message},writeDate=#{writeDate},isAnonymous=#{isAnonymous}")
    void update(BottleMessage bottleMessage);

    @Select("SELECT a.messageId,a.userId,b.nickname,b.gender,a.message,a.writeDate,a.isAnonymous FROM bottle_message a,user b WHERE a.bottleId=#{bottleId} AND b.userId=a.userId ORDER BY a.writeDate DESC")
    List<BottleMessageInfo> findBottleMessage(int bottleId);
}
