package treehole.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import treehole.entity.Secret;
import treehole.model.PageBean;
import treehole.model.SecretInfo;

import java.util.List;

public interface SecretRepository {
    @Insert("INSERT INTO secret(userId,content,tags,isAnonymous,createDate,upVote,downVote) " +
            "VALUES(#{userId},#{content},#{tags},#{isAnonymous},#{createDate},#{upVote},#{downVote})")
    void add(Secret secret);

    @Select("SELECT * FROM secret")
    List<Secret> findAllSecrets();

    @Select("SELECT * FROM secret WHERE secretId=#{secretId}")
    Secret findBySecretId(int secretId);

    @Select("SELECT * FROM secret WHERE userId=#{userId}")
    List<Secret> findByUserId(int userId);

    @Select("SELECT * FROM secret WHERE userId=#{userId} AND isAnonymous=false")
    List<Secret> findPublicByUserId(int userId);

    @Delete("DELETE FROM secret WHERE secretId=#{secretId}")
    void delete(int secretId);

    @Update("UPDATE secret SET content=#{content},tags=#{tags},isAnonymous=#{isAnonymous},upVote=#{upVote},downVote=#{downVote} WHERE secretId=#{secretId}")
    void update(Secret secret);

    @Select("SELECT count(secretId) FROM secret")
    int getPageCount();

    @Select("SELECT * FROM secret LIMIT #{0},#{1}")
    List<Secret> findPage(int startRow,int pageSize);

    @Select("SELECT a.*,b.nickname,count(c.commentId) commentCount  FROM secret a LEFT JOIN user b ON (a.userId=b.userId) LEFT JOIN comment c  ON (a.secretId=c.secretId)  GROUP BY a.secretId ORDER BY a.createDate DESC LIMIT #{0},#{1}")
    List<SecretInfo> findSecretPage(int startRow, int pageSize);

    @Update("UPDATE secret SET upVote=upVote+1 WHERE secretId=#{secretId}")
    void upVote(int secretId);

    @Update("UPDATE secret SET downVote=downVote+1 WHERE secretId=#{secretId}")
    void downVote(int secretId);

    @Select("SELECT * FROM secret WHERE tags LIKE CONCAT('%',#{tag},'%') ")
    List<Secret> findSecretWithTag(String tag);

    @Select("SELECT * FROM secret WHERE content LIKE CONCAT('%',#{content},'%') OR tags LIKE CONCAT('%',#{content},'%')")
    List<Secret> findSecretWithContent(String content);

    @Select("SELECT a.*,b.nickname,count(c.commentId) commentCount  FROM secret a LEFT JOIN user b ON (a.userId=b.userId) LEFT JOIN comment c  ON (a.secretId=c.secretId) WHERE a.tags LIKE CONCAT('%',#{2},'%') GROUP BY a.secretId  ORDER BY a.createDate DESC LIMIT #{0},#{1}")
    List<SecretInfo> findSecretPageByTag(int startRow,int pageSize,String tag);

    @Select("SELECT a.*,b.nickname,count(c.commentId) commentCount  FROM secret a LEFT JOIN user b ON (a.userId=b.userId) LEFT JOIN comment c  ON (a.secretId=c.secretId) WHERE a.content LIKE CONCAT('%',#{2},'%') OR a.tags LIKE CONCAT('%',#{2},'%') GROUP BY a.secretId  ORDER BY a.createDate DESC LIMIT #{0},#{1}")
    List<SecretInfo> findSecretPageWithContent(int startRow,int pageSize,String content);

    @Select("SELECT a.*,b.nickname,count(c.commentId) commentCount  FROM secret a LEFT JOIN user b ON (a.userId=b.userId) LEFT JOIN comment c  ON (a.secretId=c.secretId) WHERE a.userId=#{2} GROUP BY a.secretId  ORDER BY a.createDate DESC LIMIT #{0},#{1}")
    List<SecretInfo> findSecretPageByUserId(int startRow,int pageSize,int userId);

    @Select("SELECT a.*,b.nickname,count(c.commentId) commentCount  FROM secret a LEFT JOIN user b ON (a.userId=b.userId) LEFT JOIN comment c  ON (a.secretId=c.secretId) WHERE a.userId=#{2} AND a.isAnonymous=false GROUP BY a.secretId  ORDER BY a.createDate DESC LIMIT #{0},#{1}")
    List<SecretInfo> findPublicSecretPageByUserId(int startRow,int pageSize,int userId);

    @Select("SELECT a.*,b.nickname,count(c.commentId) commentCount  FROM secret a LEFT JOIN user b ON (a.userId=b.userId) LEFT JOIN comment c  ON (a.secretId=c.secretId)  GROUP BY a.secretId ORDER BY commentCount DESC LIMIT #{0},#{1}")
    List<SecretInfo> findSecretPageSortByComment(int startIndex, int pageSize);

    @Select("SELECT a.*,b.nickname,count(c.commentId) commentCount  FROM secret a LEFT JOIN user b ON (a.userId=b.userId) LEFT JOIN comment c  ON (a.secretId=c.secretId)  GROUP BY a.secretId ORDER BY upVote DESC LIMIT #{0},#{1}")
    List<SecretInfo> findSecretPageSortByUpvote(int startIndex, int pageSize);

    @Select("SELECT a.*,b.nickname,count(c.commentId) commentCount  FROM secret a LEFT JOIN user b ON (a.userId=b.userId) LEFT JOIN comment c  ON (a.secretId=c.secretId)  GROUP BY a.secretId ORDER BY downVote DESC LIMIT #{0},#{1}")
    List<SecretInfo> findSecretPageSortByDownvote(int startIndex, int pageSize);
}
