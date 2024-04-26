#source /opt/ros/noetic/setup.bash 
#source /catkin_ws/devel/setup.bash 
#cd /catkin_ws/src/webpage_ws 
#roslaunch course_web_dev_ros web.launch 

source /opt/ros/noetic/setup.bash
source /catkin_ws/devel/setup.bash
cd /catkin_ws/src/webpage_ws 

python -m http.server 7000 &

roslaunch course_web_dev_ros project.launch &

wait