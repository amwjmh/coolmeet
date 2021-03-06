package com.iths.pojo;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/18 21:39
 */
public class Constant {
    //用户通过审核
    public static  final  String STATUS_ADOPT = "1";

    //未审批默认为0，新用户状态
    public static final String STATUS_DEFAULT = "0";

    //状态用户关闭  会议室删除  , 取消会议
    public static  final  String STATUS_CLOSE= "-1";

    //每页显示条数
    public static final Integer ROWS = 6;

    //未来需要参加会议
    public static final Integer FUTURE_TIME = 7;
}
