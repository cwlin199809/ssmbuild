package com.cwlin.service;

import com.cwlin.pojo.Books;

import java.util.List;

public interface BookService {
    //增加一本书
    int insertBook(Books book);

    //删除一本书
    int deleteBookById(int id);

    //更新一本书
    int updateBook(Books books);

    //查询一本书
    Books selectBookById(int id);

    //查询全部书
    List<Books> selectAllBooks();
}
