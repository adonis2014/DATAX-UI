package net.iharding.modules.meta.util;


public enum DataMediaType {
    GREENPLUM(16),
    /** mysql DB */
    MYSQL(1),
    /** oracle DB */
    ORACLE(11),
    /** elsaticsearch  */
    ELASTICSEARCH(4),
    /** KAFKA DB */
    KAFKA(7),
    /** HBASE DB */
    HBASE(2),
    /** CASSANDRA DB */
    CASSANDRA(9),
    /** HDFS-ARVO DB */
    HDFS_ARVO(3),
    HIVE(10),
    MONGODB(5),
    PGSQL(13),
    PHOENIX(12),
    PRESTODB(8),
    SOLR(6),
    SQLSERVER(14),
    MQ(15);
    
    private int dbType;
    
    private DataMediaType(int dbType){
        this.dbType=dbType;
    }

    public int getDbType() {
        return dbType;
    }

    public void setDbType(int dbType) {
        this.dbType = dbType;
    }
    
    public static DataMediaType valueOf(int value){
        switch (value) {
            case 1:
                return MYSQL;
            case 2:
                return HBASE;
            case 3:
                return HDFS_ARVO;
            case 4:
                return ELASTICSEARCH;
            case 5:
                return MONGODB;
            case 6:
                return SOLR;
            case 7:
                return KAFKA;
            case 8:
                return PRESTODB;
            case 9:
                return CASSANDRA;
            case 10:
                return HIVE;
            case 11:
                return ORACLE;
            case 12:
                return PHOENIX;
            case 13:
                return PGSQL;
            case 14:
                return SQLSERVER;
            case 15:
                return MQ;
            case 16:
                return GREENPLUM;
            default:
                return null;
            }
    }


    public boolean isKafka() {
        return this.equals(DataMediaType.KAFKA);
    }

    public boolean isElasticSearch() {
        return this.equals(DataMediaType.ELASTICSEARCH);
    }
    
    public boolean isHBase() {
        return this.equals(DataMediaType.HBASE);
    }

    public boolean isCassandra() {
        return this.equals(DataMediaType.CASSANDRA);
    }
    public boolean isHDFSArvo() {
        return this.equals(DataMediaType.HDFS_ARVO);
    }

    public boolean isOracle() {
        return this.equals(DataMediaType.ORACLE);
    }
    public boolean isMysql() {
        return this.equals(DataMediaType.MYSQL);
    }


    public boolean isHive() {
        return this.equals(DataMediaType.HIVE);
    }

    public boolean isMongoDb() {
        return this.equals(DataMediaType.MONGODB);
    }

    public boolean isPgSql() {
        return this.equals(DataMediaType.PGSQL);
    }

    public boolean isMq() {
        return this.equals(DataMediaType.MQ);
    }
    
    public boolean isGreenPlum() {
        return this.equals(DataMediaType.GREENPLUM);
    }

    public boolean isPhoenix() {
        return this.equals(DataMediaType.PHOENIX);
    }

    public boolean isPrestoDb() {
        return this.equals(DataMediaType.PRESTODB);
    }
    
    public boolean isSolr() {
        return this.equals(DataMediaType.SOLR);
    }
    
    public boolean isSqlServer() {
        return this.equals(DataMediaType.SQLSERVER);
    }
    
}

