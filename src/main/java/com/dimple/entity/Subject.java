package com.dimple.entity;

import lombok.Data;

@Data
public class Subject {
    private String subid;

    public void setSubid(String subid) {
        this.subid = subid;
    }

    public void setSubname(String subname) {
        this.subname = subname;
    }

    private String subname;

}
