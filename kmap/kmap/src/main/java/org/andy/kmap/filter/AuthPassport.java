package org.andy.kmap.filter;

import java.lang.annotation.*;

/**
 * Created by lichao on 16/3/12.
 */
@Documented
@Inherited
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface AuthPassport {
    boolean validate() default true;
}
