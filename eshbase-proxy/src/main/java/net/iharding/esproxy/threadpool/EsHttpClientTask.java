package net.iharding.esproxy.threadpool;

import com.github.eswrapper.util.Constants;

import net.iharding.esproxy.exception.InvokeException;
import net.iharding.esproxy.throttle.EsThrottle;
import net.iharding.esproxy.utils.HttpClientUtil;

import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;

import java.util.concurrent.Callable;

/**
 * Created by yuxuefeng on 15/11/3.
 */
public class EsHttpClientTask implements Callable<String> {

    private static final Logger logger = Logger.getLogger(EsHttpClientTask.class);
    private static final Logger errorLogger = Logger.getLogger("errorLogger");

    private String url;
    private String requestData;
    private String username;
    private String password;
    private HttpServletRequest request;
    private EsThrottle esThrottle;
  
    public EsHttpClientTask(String url, String requestData, EsThrottle esThrottle, HttpServletRequest request) {
        this.url = url;
        this.requestData = requestData;
        this.esThrottle = esThrottle;
        this.request = request;
        this.username=(String)esThrottle.getConfigs().get(Constants.ES_SHIELD_USER);
        this.password=(String)esThrottle.getConfigs().get(Constants.ES_SHIELD_PASSWORD);
    }

    @Override
    public String call() throws Exception {
//        Thread.sleep(10000);
        String res = "";
        int retries = esThrottle.getRetries();
        for (int count = 0; count < retries; count++) {
            try {
                res = HttpClientUtil.sendHttpRequestByHttpClient(url, requestData, request.getContentType(), request.getMethod(),username,password);

                return res;

            } catch (Exception e) {
                Thread.sleep(500 * (count + 1));
                logger.warn("fail to send Java_Http [" + request.getMethod() + "] request,URL:[" + url + "]\nException message:" + e.getMessage() + "\nstart the [" + (count + 1) + "] time retry\n");
                res = e.getMessage();
            }
        }

        errorLogger.error("fail to send Java_Http [" + request.getMethod() + "] request after[" + retries + "] retries\nException message:" + res + "\nthe url:" + url + "\nthe requestData: " + requestData + "\n");

        throw new InvokeException("Send ES [" + request.getMethod() + "] Http Request Error,Original Exception message:" + res);
    }

//    @Override
//    public String call() throws Exception {
//        Thread.sleep(5000);
//        return "sucess";
//    }
}
