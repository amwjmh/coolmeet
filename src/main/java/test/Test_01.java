package test;

import com.iths.utils.DateConversionUtils;

import org.springframework.beans.factory.annotation.Autowired;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/24 23:36
 */
public class Test_01 {

    public void ja() throws ParseException {
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String format = simpleDateFormat.format(date);


        System.out.println(format);

    }
}
