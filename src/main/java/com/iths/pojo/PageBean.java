package com.iths.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/11 20:20
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageBean<T> {
    int totalCount; //总记录数

    int totalPage; //总页码

    List<T> list;//当前页的数据

    int currentPage; //当前页码

    int  rows;//每页显示的条数

    int offset;//偏移量
}
