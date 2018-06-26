package treehole.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import treehole.entity.Bulletin;
import treehole.entity.Wish;

import java.util.List;

public interface BulletinRepository {
    @Insert("INSERT INTO bulletin(content,createDate) VALUES (#{content},#{createDate})")
    void add(Bulletin bulletin);

    @Select("SELECT * FROM bulletin WHERE bulletinId=#{bulletinId}")
    Bulletin findById(int bulletinId);

    @Select("SELECT * FROM bulletin")
    List<Bulletin> findAll();

    @Delete("DELETE FROM bulletin WHERE bulletinId=#{bulletinId}")
    void delete(int bulletinId);

    @Update("UPDATE bulletin SET content=#{content},createDate=#{createDate}")
    void update(Bulletin bulletin);
}
