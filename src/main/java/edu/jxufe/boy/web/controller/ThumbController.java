package edu.jxufe.boy.web.controller;

import edu.jxufe.boy.service.ThumbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by liaos on 2017/4/25.
 */
@Controller
@RequestMapping("thumb")
public class ThumbController {

    @Autowired
    private ThumbService thumbService;

    /**
     * 点赞
     * @param postId
     * @param userId
     * @return
     */
    @RequestMapping("thumbUp")
    @ResponseBody
    public Map thumbUp(int postId,int userId){
        Map map = new HashMap();
        try {
            int thumbNum = thumbService.thumb_up(postId,userId);
            map.put("thumbNum",thumbNum);
        }catch (Exception e){
            map.put("msg","服务器出错");
        }
        return map;
    }

    /**
     * 点反对
     * @param postId
     * @param userId
     * @return
     */
    @RequestMapping("thumbDown")
    @ResponseBody
    public Map thumbDown(int postId,int userId){
        Map map = new HashMap();
        try {
            int thumbNum = thumbService.thumb_down(postId,userId);
            map.put("thumbNum",thumbNum);
        }catch (Exception e){
            map.put("msg","服务器出错");
        }
        return map;
    }
}
