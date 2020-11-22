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

    public static void main(String[] args) {
        int[] va = {1,21,323};

        va[va.length+1] = 12;
        System.out.println(va.length);
        System.out.println(va);
    }

    public void ja() throws ParseException {

    }
}
