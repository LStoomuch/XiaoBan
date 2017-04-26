package edu.jxufe.boy.service;

import edu.jxufe.boy.dao.PostDao;
import edu.jxufe.boy.dao.ThumbDao;
import edu.jxufe.boy.entity.Post;
import edu.jxufe.boy.entity.Thumb;
import org.jboss.logging.annotations.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by liaos on 2017/4/25.
 */
@Service
@Transactional
public class ThumbService {

    //未点过赞/反对
    private final int NOT_THUMB = 0;
    //点过赞
    private final String THUMB_UPED = "1";
    //点过反对
    private final String THUMB_DOWNED = "2";

    @Autowired
    private ThumbDao thumbDao;

    @Autowired
    private PostDao postDao;

    /**
     * 点赞
     */
    public int thumb_up(int postId, int userId) {
        Post post = postDao.get(postId);
        Thumb thumb_flag = isThumbUpOrDown(postId, userId);
        //是否已点过赞，如果已点过，那就取消赞
        if (thumb_flag == null) {
            Thumb thumb = new Thumb();
            thumb.setPostId(postId);
            thumb.setUserId(userId);
            thumb.setKind("1");
            thumbDao.save(thumb);
            post.setThumbs_up(post.getThumbs_up() + 1);
        }else{
            if (thumb_flag.getKind().equals(THUMB_UPED)){
                thumbDao.remove(thumb_flag);
                post.setThumbs_up(post.getThumbs_up()-1);
            }else{
                post.setThumbs_down(post.getThumbs_down()-1);
                thumb_flag.setKind("1");
                thumbDao.update(thumb_flag);
                post.setThumbs_up(post.getThumbs_up()+1);
            }
        }
        postDao.update(post);
        return post.getThumbs_up();
    }

    /**
     * 点反对
     */
    public int thumb_down(int postId, int userId) {
        Post post = postDao.get(postId);
        Thumb thumb_flag = isThumbUpOrDown(postId, userId);
        //是否有点过反对，如果没有点过，就添加一条记录，否则删除那条记录，添加一个新的记录
        if (thumb_flag == null){
            Thumb thumb = new Thumb();
            thumb.setPostId(postId);
            thumb.setUserId(userId);
            thumb.setKind("2");
            thumbDao.save(thumb);
            post.setThumbs_down(post.getThumbs_down() + 1);
        }else{
            if (thumb_flag.getKind().equals(THUMB_DOWNED)){
                thumbDao.remove(thumb_flag);
                post.setThumbs_down(post.getThumbs_down()-1);
            }else{
                thumb_flag.setKind("2");
                thumbDao.save(thumb_flag);
                post.setThumbs_up(post.getThumbs_up()-1);
                post.setThumbs_down((post.getThumbs_down()+1));
            }
        }
        postDao.update(post);
        return post.getThumbs_down();
    }

    /**
     * 返回结果，0：未操作过赞或反对，1：点过赞，2：点过反对
     */
    public Thumb isThumbUpOrDown(int postId, int userId) {
        Thumb thumb = thumbDao.isThumbed(postId, userId);
        return thumb;
    }
}
