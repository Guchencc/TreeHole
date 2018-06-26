package treehole.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import treehole.entity.Secret;

import java.util.List;

public interface SecretRepository {
    @Insert("INSERT INTO secret(userId,content,tags,isAnonymous,createDate,upVote,downVote) " +
            "VALUES(#{userId},#{content},#{tags},#{isAnonymous},#{createDate},#{upVote},#{downVote})")
    void add(Secret secret);

    @Select("SELECT * FROM secret WHERE secretId=#{secretId}")
    Secret findBySecretId(int secretId);

    @Select("SELECT * FROM secret WHERE userId=#{userId}")
    List<Secret> findByUserId(int userId);

    @Delete("DELETE FROM secret WHERE secretId=#{secretId}")
    void delete(int secretId);

    @Update("UPDATE secret SET content=#{content},tags=#{tags},isAnonymous=#{isAnonymous},upVote=#{upVote},downVote=#{downVote} WHERE secretId=#{secretId}")
    void update(Secret secret);
}
