package com.mycompany.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController
{
    @Autowired
    BoardDAO boardDAO;

    @RequestMapping(value = "/board/list", method = RequestMethod.GET)
    public String boardList(Model model)
    {
        model.addAttribute("list", boardDAO.getBoardList());
        return "list";
    }

    @RequestMapping(value = "/board/add", method = RequestMethod.GET)
    public String addPost()
    {
        return "addpostform";
    }

    @RequestMapping(value = "/board/add_ok", method = RequestMethod.POST)
    public String addPostOK(BoardVO vo)
    {
        if (boardDAO.insertBoard(vo) == 0)
        {
            System.out.println("데이터 추가 실패");
        }
        else
        {
            System.out.println("데이터 추가 성공");
        }

        return "redirect:list";
    }

    @RequestMapping(value = "/board/edit/{id}", method = RequestMethod.GET)
    public String editPost(@PathVariable("id") int id, Model model)
    {
        BoardVO boardVO = boardDAO.getBoard(id);
        model.addAttribute("boardVO", boardVO);

        return "editform";
    }

    @RequestMapping(value = "/board/edit_ok", method = RequestMethod.POST)
    public String editPostOK(BoardVO vo)
    {
        if (boardDAO.updateBoard(vo) == 0)
        {
            System.out.println("데이터 수정 실패");
        }
        else
        {
            System.out.println("데이터 수정 성공");
        }

        return "redirect:list";
    }

    @RequestMapping(value = "/board/delete_ok/{id}", method = RequestMethod.GET)
    public String deletePostOK(@PathVariable("id") int id)
    {
        if (boardDAO.deleteBoard(id) == 0)
        {
            System.out.println("데이터 삭제 실패");
        }
        else
        {
            System.out.println("데이터 삭제 성공");
        }

        return "redirect:../list";
    }
}
