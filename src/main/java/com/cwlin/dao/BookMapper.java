package com.cwlin.dao;

import com.cwlin.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {
    //增加一本书
    int insertBook(Books book);

    //删除一本书
    int deleteBookById(@Param("bookID") int id);

    //更新一本书
    int updateBook(Books books);

    //查询一本书
    Books selectBookById(@Param("bookID") int id);

    //查询全部书
    List<Books> selectAllBooks();
}
