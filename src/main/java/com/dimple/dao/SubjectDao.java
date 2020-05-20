package com.dimple.dao;

import com.dimple.entity.Subject;

import java.util.List;
import java.util.Map;

public interface SubjectDao {
    List<Subject> findSubjectList(Subject subject);

    int insert(Subject subject);

    Object queryById(String subid);

    int update(Subject subject);

    int deleteSave(String[] ids);

    List<Map> getSubject();
}
