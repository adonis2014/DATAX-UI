package net.iharding.modules.meta.wrapper;

import java.util.Properties;


import net.iharding.modules.meta.model.DataSourceWrapper;
import net.iharding.modules.meta.model.MetaProperty;
import net.iharding.modules.meta.util.DataMediaType;

public class DbMediaSource extends DataSourceWrapper {

    private String            url;
    private String            username;
    private String            password;
    private String            driver;
    private DataMediaType     type;
    private String            encode;
    private Properties        extendProperties;

    public String getUrl() {
        if (this.url==null){
            this.url=this.getPropertyValue("jdbcurl");
        }
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUsername() {
        if (this.username==null){
            this.username=this.getPropertyValue("username");
        }
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        if (this.password==null){
            this.password=this.getPropertyValue("password");
        }
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDriver() {
        if (this.driver==null){
            this.driver=this.getPropertyValue("jdbcdriver");
        }
        return this.driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public Properties getExtendProperties() {
        if (this.extendProperties==null){
            extendProperties=new Properties();
            for (MetaProperty mp : properties) {
                extendProperties.put(mp.getPropertyKey(),mp.getPropertyValue());
            }
        }
        return extendProperties;
    }

    public void setExtendProperties(Properties extendProperties) {
        this.extendProperties = extendProperties;
    }

    public DataMediaType getType() {
        if (type==null){
            this.type= DataMediaType.valueOf(getPropertyValue("dbtype"));
        }
        return type;
    }

    public void setType(DataMediaType type) {
        this.type = type;
    }

    public String getEncode() {
        if (this.encode==null){
            this.encode=this.getPropertyValue("encode");
        }
        return encode;
    }

    public void setEncode(String encode) {
        this.encode = encode;
    }

    
}
