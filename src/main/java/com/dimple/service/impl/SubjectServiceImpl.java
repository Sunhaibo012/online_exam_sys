package com.dimple.service.impl;

import com.dimple.dao.SubjectDao;
import com.dimple.entity.Subject;
import com.dimple.service.SubjectService;
import com.dimple.utils.Convert;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class SubjectServiceImpl implements SubjectService {

    @Resource
    private SubjectDao dao;

    @Override
    public List<Subject> findSubjectList(Subject subject) {
        return dao.findSubjectList(subject);
    }

    @Override
    public int insert(Subject subject) {
        return dao.insert(subject);
    }

    @Override
    public Object queryById(String id) {
        return dao.queryById(id);
    }

    @Override
    public int update(Subject subject) {
        return dao.update(subject);
    }

    @Override
    public int deleteSave(String ids) {
        return dao.deleteSave(Convert.toStrArray(ids));
    }

    @Override
    public List<Map> getSubject() {
        return dao.getSubject();
    }
}
