package net.iharding.datax.main;

import com.dangdang.ddframe.reg.base.CoordinatorRegistryCenter;
import com.dangdang.ddframe.reg.zookeeper.ZookeeperConfiguration;
import com.dangdang.ddframe.reg.zookeeper.ZookeeperRegistryCenter;

public class JobMain {
	private final ZookeeperConfiguration zkConfig = new ZookeeperConfiguration("localhost:2181", "etl", 1000, 3000, 3);

	private final CoordinatorRegistryCenter regCenter = new ZookeeperRegistryCenter(zkConfig);

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
