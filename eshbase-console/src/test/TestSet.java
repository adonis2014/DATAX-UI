import java.io.IOException;
import java.text.ParseException;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import com.enniu.vdata.utils.HBDateUtils;


public class TestSet {
	public static void main(String[] args) {
	try {
		System.out.println(HBDateUtils.getLocalTimeFromUTC("2014-11-01 16:00:00.0","yyyy-MM-dd HH:mm:ss.s"));
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
	}

}
