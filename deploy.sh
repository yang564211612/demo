#!/usr/bin/env bash
#编译+部署order站点

#需要配置如下参数
# 项目路径, 在Execute Shell中配置项目路径, pwd 就可以获得该项目路径
# export PROJ_PATH=这个jenkins任务在部署机器上的路径

# 输入你的环境上tomcat的全路径
# export TOMCAT_APP_PATH=tomcat在部署机器上的路径



echo "备份原有jar包"
mv $PROJ_PATH/demo/target/demo-0.0.1-SNAPSHOT.jar $PROJ_PATH/bak/demo-0.0.1-SNAPSHOT.jar_bak$(date +%Y%m%d%H%M%S)
echo "备份原有jar包完毕"

### base 函数
killDemo()
{
    pid=`ps -ef|grep demo|grep java|awk '{print $2}'`
    echo "tomcat Id list :$pid"
    if [ "$pid" = "" ]
    then
      echo "no demo pid alive"
    else
      kill -9 $pid
    fi
}

cd $PROJ_PATH/demo
mvn clean install

# 停demo
killDemo
# 启动demo
nohup java -jar $PROJ_PATH/demo/target/demo-0.0.1-SNAPSHOT.jar &



