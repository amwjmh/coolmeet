package com.iths.utils;


import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/24 14:59
 * String去T转Date ---datetime-local -> Date
 */
public class DateConversionUtils {

    public SimpleDateFormat simpleDateFormat;

    public void setSimpleDateFormat(SimpleDateFormat simpleDateFormat) {
        this.simpleDateFormat = simpleDateFormat;
    }

    private Date time = null;

    public  Date conversion(String ts) throws ParseException {
        //转换
        time = simpleDateFormat.parse(ts.replace("T", " "));

        return time;
    }

}
