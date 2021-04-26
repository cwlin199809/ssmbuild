package com.cwlin.service;

import com.cwlin.dao.BookMapper;
import com.cwlin.pojo.Books;
import org.springframework.stereotype.Service;

import java.util.List;

public class BookServiceImpl implements BookService {
    //Service层调用dao层: 组合Dao
    private BookMapper bookMapper;

    public void setBookMapper(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    @Override
    public int insertBook(Books books) {
        return bookMapper.insertBook(books);
    }

    @Override
    public int deleteBookById(int id) {
        return bookMapper.deleteBookById(id);
    }

    @Override
    public int updateBook(Books books) {
        return bookMapper.updateBook(books);
    }

    @Override
    public Books selectBookById(int id) {
        return bookMapper.selectBookById(id);
    }

    @Override
    public List<Books> selectAllBooks() {
        return bookMapper.selectAllBooks();
    }
}
