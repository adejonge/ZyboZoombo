#include <geometry_msgs/Twist.h>
#include <std_msgs/Float64.h>
#include <ros/ros.h>

const double WHEEL_LENGTH =  0.1524; //6in to m
/*current measurements:
WHEEL_LENGTH: 0.1524m

*/
//GAMMA is the constant relating steering wheel angle 
//  (in our case, servo angle) to tire angle
const double GAMMA = 600;

ros::Publisher steering_cmd;
ros::Publisher cmd_vel;

void timerCallback(const ros::TimerEvent& event){
  const char * PLCommand = (const char *)0x412F0000;
  char * ServoOutput = (char *)0x41200000;
  double v = 5.0;
  double psi_dot = 0.0;

if(*PLCommand == 0) { //strong left
  v = 0.0;
  psi_dot = 0.0;
}else if(*PLCommand == 1){ //slight left
  v = 0.0;
  psi_dot = 0.0;
}else if(*PLCommand == 2){ //straight
  v = 0.0;
  psi_dot = 0.0;
}else if(*PLCommand == 3){ //slight right
  v = 0.0;
  psi_dot = 0.0;
}else if(*PLCommand == 4){ //strong right
  v = 0.0;
  psi_dot = 0.0;
}
  

  geometry_msgs::Twist vel;
  std_msgs::Float64 steering;

  vel.linear.x = v;
  steering.data = GAMMA*atan((WHEEL_LENGTH*psi_dot)/v);
  *ServoOutput = 64;

  cmd_vel.publish(vel);
  steering_cmd.publish(steering);

}

int main(int argc, char** argv){
  ros::init(argc,argv,"zybo_drive");
  ros::NodeHandle zybo_drive;

  cmd_vel = zybo_drive.advertise<geometry_msgs::Twist>("audibot/cmd_vel", 1);
  steering_cmd = zybo_drive.advertise<std_msgs::Float64>("audibot/steering_cmd", 1);

  ros::Timer marker_timer = zybo_drive.createTimer(ros::Duration(1.0/60), timerCallback);

  ros::spin();
}