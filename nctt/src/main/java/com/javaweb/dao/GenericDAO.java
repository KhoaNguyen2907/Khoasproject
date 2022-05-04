package com.javaweb.dao;

import java.util.List;

import com.javaweb.mapper.RowMapper;

public interface GenericDAO<T> {
List<T> query(String sql, RowMapper<T> rm, Object... parameters);
Long insert(String sql, Object... parameters);
void update (String sql, Object... parameters);
}
