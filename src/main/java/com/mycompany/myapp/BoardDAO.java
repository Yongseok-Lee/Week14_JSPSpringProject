package com.mycompany.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class BoardDAO
{
    @Autowired
    private JdbcTemplate template;

    private final String BOARD_INSERT = "INSERT into Board (category, title, writer, content)  VALUES (?, ?, ?, ?)";
    private final String BOARD_UPDATE = "UPDATE Board set category = ?, title = ?, writer = ?, content = ? WHERE seq = ?";
    private final String BOARD_DELETE = "DELETE from Board WHERE seq = ?";
    private final String BOARD_GET    = "SELECT * from Board WHERE seq = ?";
    private final String BOARD_LIST   = "SELECT * from Board ORDER BY seq desc";

    public void setTemplate(JdbcTemplate template)
    {
        this.template = template;
    }

    public int insertBoard(BoardVO vo)
    {
        return template.update(BOARD_INSERT, new Object[] { vo.getCategory(), vo.getTitle(), vo.getWriter(), vo.getContent() });
    }

    public int updateBoard(BoardVO vo)
    {
        return template.update(BOARD_UPDATE, new Object[] { vo.getCategory(), vo.getTitle(), vo.getWriter(), vo.getContent(), vo.getSeq() });
    }

    public int deleteBoard(int id)
    {
        return template.update(BOARD_DELETE, new Object[] { id });
    }

    public BoardVO getBoard(int seq)
    {
        return template.queryForObject(BOARD_GET, new Object[] { seq }, new BeanPropertyRowMapper<BoardVO>(BoardVO.class));
    }

    public List<BoardVO> getBoardList()
    {
        return template.query(BOARD_LIST, new RowMapper<BoardVO>()
        {
            @Override
            public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException
            {
                BoardVO data = new BoardVO();

                data.setSeq(rs.getInt("seq"));
                data.setCategory(rs.getString("category"));
                data.setTitle(rs.getString("title"));
                data.setWriter(rs.getString("writer"));
                data.setContent(rs.getString("content"));
                data.setRegdate(rs.getDate("regdate"));

                return data;
            }
        });
    }
}
