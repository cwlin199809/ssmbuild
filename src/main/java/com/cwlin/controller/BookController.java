package com.cwlin.controller;

import com.cwlin.pojo.Books;
import com.cwlin.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {
    //controller层调用service层
    @Autowired
    @Qualifier("bookServiceImpl")
    private BookService bookService;

    //查询全部书籍，返回到一个书籍展示页面
    @RequestMapping("/allBook")
    public String list(Model model){
        List<Books> books = bookService.selectAllBooks();
        model.addAttribute("list", books);
        return "allBook";
    }

    //跳转到增加书籍页面
    @RequestMapping("/toInsertBook")
    public String toInsertBook(){
        return "insertBook";
    }
    //添加书籍的请求
    @RequestMapping("insertBook")
    public String insertBook(Books books){
        System.out.println("insertBook => "+books);
        bookService.insertBook(books);
        return "redirect:/book/allBook"; //重定向
    }

    //跳转到修改书籍页面
    @RequestMapping("toUpdateBook")
    public String toUpdateBook(Model model, int id){
        Books books = bookService.selectBookById(id);
        model.addAttribute("books", books);
        return "updateBook";
    }
    //修改书籍的请求
    @RequestMapping("updateBook")
    public String updateBook(Books books){
        System.out.println("updateBook => "+books);
        bookService.updateBook(books);
        return "redirect:/book/allBook"; //重定向
    }

    //修改书籍的请求
    @RequestMapping("deleteBook/{bookId}")
    public String deleteBook(@PathVariable("bookId")int id){
        System.out.println("deleteBook => "+id);
        bookService.deleteBookById(id);
        return "redirect:/book/allBook"; //重定向
    }

    //查询书籍的请求
    @RequestMapping("selectBook")
    public String selectBook(Model model, String selectBookName){
        System.out.println("selectBook => "+selectBookName);
        List<Books> books = bookService.selectBookByName(selectBookName);
        if(books.isEmpty()){
            model.addAttribute("error","未查询到书籍");
            return "allBook";
        }
        model.addAttribute("list", books);
        return "allBook";
    }
}
