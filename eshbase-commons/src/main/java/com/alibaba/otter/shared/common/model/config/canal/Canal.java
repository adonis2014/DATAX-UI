package com.alibaba.otter.shared.common.model.config.canal;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import net.iharding.core.orm.IdEntity;

@Entity
@Table(name = "stream_canal")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Canal extends IdEntity {
    
    @Column(name = "NAME")
    private String name;        // canal名字
    
    @Column(name = "DESCRIPTION")
    private String description; // 描述
    
    @Column(name = "PARAMETERS")
    private String parameters;  // 参数定义
    
    @Column(name = "GMT_CREATE")
    private Date              gmtCreate;   // 创建时间

    @Column(name = "GMT_MODIFIED")
    private Date              gmtModified; // 修改时间
    
}
