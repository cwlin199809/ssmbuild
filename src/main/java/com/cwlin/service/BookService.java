package com.cwlin.service;

import com.cwlin.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookService {
    //增加一本书
    int insertBook(Books book);

    //删除一本书
    int deleteBookById(int id);

    //更新一本书
    int updateBook(Books books);

    //根据ID查询一本书
    Books selectBookById(int id);

    //根据名称查询一本书
    List<Books> selectBookByName(String name);

    //查询全部书
    List<Books> selectAllBooks();
}
