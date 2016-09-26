package edu.jxufe.boy.util.annotations;

/**
 * Created by Raomengnan on 2016/5/30.
 */

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface AuthorityTocken {
        boolean verify() default false;
        boolean remove() default false;
}
