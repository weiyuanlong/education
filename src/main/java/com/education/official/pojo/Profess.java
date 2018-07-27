package com.education.official.pojo;

import java.io.Serializable;
import java.util.Date;

/**.
 * 专业实体类
 *
 * @Author:weiyuanlong
 * @Date: Created in 2018-07-27 14:50:12
 * @Modified By:
 */
public class Profess implements Serializable {

    private Integer id;

    /** 层级 */
    private Integer level;

    private Integer parentId;

    /** 描述 */
    private String content;

    /** 专业名称 */
    private String professName;

    /** 岗位 */
    private String quartName;

    /** 薪水 */
    private String salary;

    /** 招生数量 */
    private String studentNum;

    private boolean invalid;

    private boolean deleted;

    private Date createTime;

    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getProfessName() {
        return professName;
    }

    public void setProfessName(String professName) {
        this.professName = professName;
    }

    public String getQuartName() {
        return quartName;
    }

    public void setQuartName(String quartName) {
        this.quartName = quartName;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(String studentNum) {
        this.studentNum = studentNum;
    }

    public boolean isInvalid() {
        return invalid;
    }

    public void setInvalid(boolean invalid) {
        this.invalid = invalid;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
