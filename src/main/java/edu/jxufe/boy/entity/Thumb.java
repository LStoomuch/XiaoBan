package edu.jxufe.boy.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by liaos on 2017/4/25.
 */
@Entity
@Table(name = "t_thumb")
public class Thumb {
    @Id
    @Column(name = "thumb_id")
    private int thumbId;

    @Column(name = "post_id")
    private int postId;

    @Column(name = "user_id")
    private int userId;

    @Column(name = "kind")
    private String kind;

    public int getThumbId() {
        return thumbId;
    }

    public void setThumbId(int thumbId) {
        this.thumbId = thumbId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }
}
