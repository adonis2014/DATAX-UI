package net.iharding.core.timer;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Job {

 

    
    /**
     * 每天1点执行一次
     * */
    @Scheduled(cron="0 0 1 * * ?") 
    public void oneOClockPerDay(){
        System.out.println("1h");
    }
    
    
    
}