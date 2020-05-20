package com.dimple.service;

import com.dimple.entity.Subject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public interface SubjectService {


    List<Subject> findSubjectList(Subject subject);

    int insert(Subject subject);

    Object queryById(String id);

    int update(Subject subject);

    int deleteSave(String ids);

    List<Map> getSubject();
}
