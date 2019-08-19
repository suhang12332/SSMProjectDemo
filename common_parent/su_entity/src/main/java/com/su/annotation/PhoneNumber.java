package com.su.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.CONSTRUCTOR;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.ElementType.PARAMETER;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/19 下午9:27
 */
//说明该注解将被包含在javadoc中
@Documented
// 注解的作用目标 类上、方法上、属性上
@Target({ElementType.FIELD, ElementType.PARAMETER})
// 注解的保留位置　　
@Retention(RetentionPolicy.RUNTIME)
// 校验注解必须使用@Constraint
@Constraint(validatedBy = PhoneNumberValidator.class)
public @interface PhoneNumber {
    /**
     * 如果校验不通过的话,返回信息
     */
    String message() default "你家联系方式有字母.";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
