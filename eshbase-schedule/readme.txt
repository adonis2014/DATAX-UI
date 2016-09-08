
zookeeper维护server task两个文件夹。server存放连接的节点，task存放注册的任务

为了防止羊群效应每个服务器上维护一个EPHEMERAL_SEQUENTIAL类型节点。选取序列号最小的节点为主节点。

task节点按照任务名称/主节点id  形式注册到zookeeper

任务调度时利用反射机制构建任务，并获取task节点中的主节点id与当前节点id比对，是当前服务器进行相关任务调度。

注册spring:
<bean id="zkScheduleManager" class="cn.uncode.schedule.ZKScheduleManager"
			init-method="init">
			<property name="zkConfig">
		           <map>
		              <entry key="zkConnectString" value="${zkSchedule.host}" />
		              <entry key="rootPath" value="${zkSchedule.path}" />
		              <entry key="zkSessionTimeout" value="${zkSchedule.timeout}" />
		              <entry key="userName" value="${zkSchedule.userName}" />
		              <entry key="password" value="${zkSchedule.password}" />
		              <entry key="autoRegisterTask" value="true" />
		           </map>
			</property>
		</bean>	
核心类：

ConsoleManager.addTaskDefine方法，给zookeeper服务注册调度任务配置信息

cn.uncode.schedule.ZKScheduleManager
入口：init()方法;
读取spring配置zkConfig信息
init(Properties p):
掉用ZKManager类，使用 InitialThread，根据zkConfig连接zk,并调用initialData方法，
初始化ScheduleDataManager4ZK，注册registerScheduleServer
hearBeatTimer 启动心跳过程；HeartBeatTimerTask 默认2s一次心跳
心跳执行：ZKScheduleManager.refreshScheduleServer();
//调度信息重写
rewriteScheduleInfo();
写入zk配置信息
// 重新分配任务 根据当前调度服务器的信息，重新计算分配所有的调度任务
this.assignScheduleTask();
// 检查本地任务
this.checkLocalTask();