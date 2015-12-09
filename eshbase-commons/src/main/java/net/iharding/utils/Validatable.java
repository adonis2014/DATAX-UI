package net.iharding.utils;

/**
 * 一类可验证类的接口
 *
 * @author: zhangxuhui
 * @date: 13-10-12 上午9:36
 */
public interface Validatable {

    /**
     * 验证本对象是否合法
     * @return
     */
    boolean validate();
}
