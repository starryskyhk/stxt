package com.core.stxt.common.model;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import java.util.HashMap;
import java.util.List;

/**
 * 统一结果处理
 */
public class R extends HashMap<String, Object> {
    //请求成功，无数据
    public static R ok() {
        R r = new R();
        r.put("code", 0);
        r.put("msg", "请求成功");
        return r;
    }
    //请求成功，带消息
    public static R ok(String msg) {
        R r = new R();
        r.put("code", 0);
        r.put("msg", msg);
        return r;
    }
    //请求成功，带消息和数据
    public static R ok(String msg, Object data) {
        R r = new R();
        r.put("code", 0);
        r.put("msg", msg);
        r.put("data", data);
        return r;
    }
    //请求成功，分页数据
    public static <T> R ok(Page<T> page) {
        // 获取当前页的数据集
        List<T> rows = page.getRecords();
        // 获取满足条件的总记录数
        Long total = page.getTotal();
        return R.ok()
                .put("total", total)
                .put("rows", rows);
    }
    //请求失败带消息
    public static R error(String msg) {
        R r = new R();
        r.put("code", 1);
        r.put("msg", msg);
        return r;
    }
    //请求失败，自定义状态码和消息
    public static R error(int code, String msg) {
        R r = new R();
        r.put("code", code);
        r.put("msg", msg);
        return r;
    }

    @Override
    public R put(String key, Object value) {
        super.put(key, value);
        return this;
    }
}
