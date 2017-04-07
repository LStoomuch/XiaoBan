package edu.jxufe.boy.dao;

import java.util.Iterator;

import edu.jxufe.boy.entity.Board;
import org.springframework.stereotype.Repository;


@Repository
public class BoardDao extends BaseDao<Board>{
	protected final String GET_BOARD_NUM = "select count(f.boardId) from Board f";

	private final String GET_PAGED_BOARDS = "from Board ";


	public long getBoardNum() {    
		Iterator iter = getHibernateTemplate().iterate(GET_BOARD_NUM);
        return ((Long)iter.next());
	}

	public Page getPagedBoards(int pageNo,int pageSize) {
		Page page = pagedQuery(GET_PAGED_BOARDS,pageNo,pageSize,null);
		return  page;
	}

}
