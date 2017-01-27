package org.nlpcn.es4sql.domain;


/**
 * Represents the from clause.
 * Contains index and type which the
 * query refer to.
 */
public class From {
	private String index;
	private String type;
    private String alias;
    private String htableName;
    
	/**
 	 * Extract index and type from the 'from' string
	 * @param from The part after the FROM keyword.
	 */
	public From(String from) {
		String[] parts = from.split("/");
		this.index = parts[0].trim();
		if (parts.length == 2) {
			String[] types=parts[1].trim().split(":");
			if (types.length==2){
				this.type=types[0].trim();
				this.htableName=types[1].trim();
			}else{
				this.type = parts[1].trim();
				htableName=this.type;
			}
		}
	}

    public From(String from,String alias){
        this(from);
        this.alias = alias;
    }
    
    public String getHtableName() {
		return htableName;
	}

	public void setHtableName(String htableName) {
		this.htableName = htableName;
	}

	public String getIndex() {
		return index ;
	}

	public void setIndex(String index) {
		this.index = index;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }
}
