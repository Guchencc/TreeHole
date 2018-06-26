package treehole.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import treehole.entity.Comment;
import treehole.entity.Follow;

import java.util.List;

public interface CommentRepository {
    @Insert("INSERT INTO comment(secretId,userId,comment,commentDate,isAnonymous) VALUES (#{secretId},#{userId},#{comment},#{commentDate},#{isAnonymous})")
    void add(Comment comment);

    @Select("SELECT * FROM comment WHERE commentId=#{commentId}")
    Comment findByCommentId(int commentId);

    @Select("SELECT * FROM comment WHERE secretId=#{secretId}")
    List<Comment> findBySecretId(int secretId);

    @Select("SELECT * FROM comment WHERE userId=#{userId}")
    List<Comment> findByUserId(int userId);

    @Delete("DELETE FROM comment WHERE commentId=#{commentId}")
    void delete(int commentId);

    @Update("UPDATE comment SET secretId=#{secretId},userId=#{userId},comment=#{comment},commentDate=#{commentDate},isAnonymous=#{isAnonymous} WHERE commentId=#{commentId}")
    void update(Comment comment);
}
