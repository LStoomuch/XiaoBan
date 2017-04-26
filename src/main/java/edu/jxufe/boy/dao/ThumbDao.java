package edu.jxufe.boy.dao;

import edu.jxufe.boy.entity.MainPost;
import edu.jxufe.boy.entity.Thumb;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by liaos on 2017/4/25.
 */
@Repository
public class ThumbDao extends BaseDao<Thumb> {
    //某个评论回复下，某个人是否点赞/反对
    private final String IS_THUMBED = "from Thumb t where t.postId=? and t.userId=? ";


    /**
     * 是否已点过赞/反对
     */
    public Thumb isThumbed(int postId,int userId){
        Query query = super.createQuery(IS_THUMBED,postId,userId);
        List list = query.list();
        Thumb thumb = null;
        if (list!=null&&list.size()!=0) {
            thumb = (Thumb) list.get(0);
            return thumb;
        }
        else{
            return thumb;
        }
    }


}
