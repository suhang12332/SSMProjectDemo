package com.su.annotation;

import java.util.regex.Pattern;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/19 下午9:28
 */
public class PhoneNumberValidator implements ConstraintValidator<PhoneNumber, String> {
    /**
     * PhoneNumber为自定义注解,String为注解的参数类型
     */
    @Override
    public boolean isValid(String value, ConstraintValidatorContext constraintValidatorContext) {
        //value就是要验证的数据
        if (value != null) {
            //手机号验证规则
            String regexp = "^[0-9]*$";
            boolean matches = Pattern.matches(regexp, value);
            return matches;
        }
        return false;
    }
}
