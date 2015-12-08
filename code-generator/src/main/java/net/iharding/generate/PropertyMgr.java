package net.iharding.generate;

import java.io.*;
import java.util.*;

/**
 * This class handles reading/writing properties
 *
 *@author     Administrator
 *@version    1.1.2
 */
public class PropertyMgr {
  private String filename = "StrutsCreator.properties";
  private Properties properties = null;


  /**
   * Constructor for PropertyMgr.
   *
   *@param  filename  Description of Parameter
   */
  public PropertyMgr(String filename) {
    this.filename = "/"+filename;
  }


  /**
   * This method stores a String property.
   *
   *@param  key              The key that identifies the resource to be loaded.
   *@param  value            The String resource to identify identified with by the key.
   *@exception  IOException  Description of Exception
   */
  public void set(String key, String value) throws IOException {
    setProperty(key, value);
  }


  /**
   * This method stores a char property value.
   *
   *@param  key              The key that identifies the resource to be loaded.
   *@param  value            The char value to identify eith the key.
   *@exception  IOException  Description of Exception
   */
  public void set(String key, char value) throws IOException {
    setProperty(key, new Character(value).toString());
  }


  /**
   * This method stores a int value associated with a given key.
   *
   *@param  key              The key that identifies the resource to be loaded.
   *@param  value            The int value to assiciate with the key.
   *@exception  IOException  Description of Exception
   */
  public void set(String key, int value) throws IOException {
    setProperty(key, new Integer(value).toString());
  }


  /**
   * This method stores a boolean value associated with a given key.
   *
   *@param  key              The key that identifies the resource to be loaded.
   *@param  value            The boolean value to assiciate with the key.
   *@exception  IOException  Description of Exception
   */
  public void set(String key, boolean value) throws IOException {
    setProperty(key, new Boolean(value).toString());
  }


  /**
   * This method returns the String property specified by the key.
   *
   *@param  key  The key that identifies the resource to be loaded.
   *@return      The the property value to identify by the key or an empty
   * String ("") if the key was undefined or could not be retrieved.
   */
  public String get(String key) {
    return get(key, "");
  }


  /**
   * This method returns the String property specified by the key, or a default
   * value, if the key wasen't defined.
   *
   *@param  key           The key that identifies the resource to be loaded.
   *@param  defaultValue  The the default property value to return, if the property
   * wasn't defined or could,'t be read.
   *@return               The the property value to identify by the key or the default value
   * if the key was undefined or could not be retrieved.
   */
  public String get(String key, String defaultValue) {
    String value;
    try {
      value = getProperties().getProperty(key);
      if(value == null) {
        value = defaultValue;
      }
    } catch(IOException e) {
      value = defaultValue;
    }
    return value;
  }


  /**
   * This method returns the char resource specified by the key.
   *
   *@param  key              The key that identifies the resource to be loaded.
   *@return                  The char property identified by the key or '\0' if the false if the
   * property was undefined or could not be retrieved.
   *@exception  IOException  Description of Exception
   */
  public char getChar(String key) throws IOException {
    String value = getProperties().getProperty(key);
    char chValue = '\0';
    if(value != null) {
      chValue = value.charAt(0);
    }
    return chValue;
  }


  /**
   * This method returns the int property value specified by the key.
   *
   *@param  key  The key that identifies the resource to be loaded.
   *@return      The int property identified by the key or 0 if the
   * property was undefined or could not be retrieved.
   */
  public int getInt(String key) {
    return getInt(key, 0);
  }


  /**
   * This method returns the int property value specified by the key.
   *
   *@param  key           The key that identifies the resource to be loaded.
   *@param  defaultValue  A default value.
   *@return               The int property identified by the key or defaultValue if the
   * property was undefined or could not be retrieved.
   */
  public int getInt(String key, int defaultValue) {
    int iValue = defaultValue;
    try {
      String value = getProperties().getProperty(key);
      if(value != null) {
        iValue = Integer.valueOf(value).intValue();
      }
    } catch(IOException e) {
      // Nothing
    }
    return iValue;
  }


  /**
   * This method returns the boolean property value specified by the key.
   *
   *@param  key  The key that identifies the resource to be loaded.
   *@return      The boolean property identified by the key or false if the
   * property was undefined or could not be retrieved.
   */
  public boolean getBoolean(String key) {
    return getBoolean(key, false);
  }


  /**
   * This method returns the boolean property value specified by the key.
   *
   *@param  key           The key that identifies the resource to be loaded.
   *?@param  defaultValue The default value.
   *@param  defaultValue  Description of Parameter
   *@return               The boolean property identified by the key or DefaultValue if the
   * property was undefined or could not be retrieved.
   */
  public boolean getBoolean(String key, boolean defaultValue) {
    boolean bValue = defaultValue;
    try {
      String value = getProperties().getProperty(key);
      if(value.equalsIgnoreCase("true")) {
        bValue = true;
      } else if(value.equalsIgnoreCase("false")) {
        bValue = false;
      }
    } catch(Exception e) {
      // Nothing
    }
    return bValue;
  }


  /**
   * Store the properties.
   *
   *@exception  IOException  Description of Exception
   */
  public synchronized void storeProperties() throws IOException {
    OutputStream os = new LineSorterOutputStream(new FileOutputStream(filename));
    try {
      getProperties().store(os, filename);
    } finally {
      os.close();
    }
  }


  /**
   * Store a property.
   *
   *@param  key              a key to add/update in the property file.
   *@param  value            the value to associate with the key.
   *@exception  IOException  Description of Exception
   */
  protected synchronized void setProperty(String key, String value) throws IOException {
    getProperties().setProperty(key, value);
  }


  /**
   * Load the stored properties.
   *
   *@return                  the set of properties loaded.
   *@exception  IOException  Description of Exception
   */
  protected synchronized Properties getProperties() throws IOException {
    if(properties == null) {
      properties = new Properties();
      try {
        InputStream is = new BufferedInputStream(this.getClass().getResourceAsStream(filename));
        properties.load(is);
        is.close();
      } catch(FileNotFoundException e) {
        System.out.println(e.getMessage());
        e.printStackTrace();
      }
    }
    return properties;
  }
}

/**
 *@author     Administrator
 *@version    2002/05/14
 */
class LineSorterOutputStream extends FilterOutputStream {


  byte[] line;

  private TreeSet lines;


  public LineSorterOutputStream(OutputStream os) {
    super(os);
    line = new byte[0];
    lines = new TreeSet(new ByteArrayComparator());
  }


  public void write(byte[] b, int offset, int len) throws IOException {
    byte[] bytes = new byte[line.length + len];
    System.arraycopy(line, 0, bytes, 0, line.length);
    System.arraycopy(b, 0, bytes, line.length, len);

    int lastPos = -1;
    for(int byteNo = 0; byteNo < bytes.length; byteNo++) {
      if(bytes[byteNo] == '\n') {
        byte[] newLine = new byte[byteNo - lastPos];
        System.arraycopy(bytes, lastPos + 1, newLine, 0, byteNo - lastPos);
        lines.add(newLine);
        lastPos = byteNo;
      }
    }
    line = new byte[bytes.length - lastPos];
    if(lastPos < bytes.length) {
      System.arraycopy(bytes, lastPos + 1, line, 0, bytes.length - lastPos - 1);
    }
  }


  public void flush() throws IOException {
    if(lines != null) {
      Iterator it = lines.iterator();
      while(it.hasNext()) {
        out.write((byte[]) it.next());
      }
      super.flush();
    }
    lines = new TreeSet(new ByteArrayComparator());
  }


  public void close() throws IOException {
    flush();
    super.close();
  }


  /**
   *@author     Administrator
   *@version    1.1.2
   */
  class ByteArrayComparator implements Comparator {
    public final static int LESS = -1;
    public final static int EQUAL = 0;
    public final static int MORE = 1;
    public final static int ERROR = 0;


    /**
     * Compare two byte arrays (up to the length of the shortest array).
     *
     *@param  obj1  the first byte array.
     *@param  obj2  the second byte array.
     *@return       -1 if obj1 < obj2, 0 if obj1 == obj2 or if one of the
     *   parameters are not a byte array, 1 if obj1 > obj2.
     */
    public int compare(Object obj1, Object obj2) {
      byte[] barr1;
      byte[] barr2;
      try {
        barr1 = (byte[]) obj1;
        barr2 = (byte[]) obj2;
      } catch(ClassCastException cce) {
        return ERROR;
      }
      int length = Math.min(barr1.length, barr2.length);
      int result = EQUAL;
      for(int byteNo = 0; byteNo < length; byteNo++) {
        if(barr1[byteNo] < barr2[byteNo]) {
          result = LESS;
          break;
        } else if(barr1[byteNo] > barr2[byteNo]) {
          result = MORE;
          break;
        }
      }
      return result;
    }
  }
}

// class LineSorterOutputStream

