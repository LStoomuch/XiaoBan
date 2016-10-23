package edu.jxufe.boy.util.convert;

import edu.jxufe.boy.entity.User;
import org.springframework.core.convert.converter.Converter;

/**
 * Created by liaos on 2016/10/12.
 */
public class StringToUserConvert implements Converter<String,User>{
       public User convert(String source){
        User user=new User();
        if(source!=null){
            String[] item=source.split(":");
            user.setCity(item[0]);
            user.setPhone(item[1]);
            user.setEmail(item[2]);
        }
      return user;
    }
}
