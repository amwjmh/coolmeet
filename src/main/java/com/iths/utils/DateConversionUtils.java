package com.iths.utils;


import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/24 14:59
 *
 */
public class DateConversionUtils {

    public SimpleDateFormat simpleDateFormat;

    public void setSimpleDateFormat(SimpleDateFormat simpleDateFormat) {
        this.simpleDateFormat = simpleDateFormat;
    }


    /**
     * String去T转Date ---datetime-local -> Date
     * @param ts
     * @return
     * @throws ParseException
     */
    public  String conversionDate(String ts) throws ParseException {

        return  ts.replace("T", " ");


    }

    /**
     * Date转String
     * @param ts
     * @return
     * @throws ParseException
     */
    public  String converString(Date ts) throws ParseException {
        String parse = simpleDateFormat.format(ts);
        return parse;
    }


}
