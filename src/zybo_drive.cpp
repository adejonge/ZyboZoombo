#include <std_msgs/Float64.h>
#include <ros/ros.h>

const double WHEEL_LENGTH =  0.1524; //6in to m
/*current measurements:
WHEEL_LENGTH: 0.1524m

*/
//GAMMA is the constant relating steering wheel angle 
//  (in our case, servo angle) to tire angle
const double GAMMA = 60;


ros::Publisher steering_cmd;
ros::Publisher cmd_vel;

void timerCallback(const ros::TimerEvent& event){
  const char * PLCommand = (const char *)0x412F0000;
  char * ServoOutput = (char *)0x41200000;
  double v = 5.0;
  double psi_dot = 0.0;

if(*PLCommand == 0) { //strong left
  v = 0.0;
  * ServoOutput = 0.0;
}else if(*PLCommand == 1){ //slight left
  v = 0.0;
  * ServoOutput = 0.0;
}else if(*PLCommand == 2){ //straight
  v = 0.0;
  * ServoOutput = 0.0;
}else if(*PLCommand == 3){ //slight right
  v = 0.0;
  * ServoOutput = 0.0;
}else if(*PLCommand == 4){ //strong right
  v = 0.0;
  * ServoOutput = 0.0;
}


}


int main(int argc, char** argv){
  ros::init(argc,argv,"zybo_drive");
  ros::NodeHandle zybo_drive;

  

  ros::Timer marker_timer = zybo_drive.createTimer(ros::Duration(60), timerCallback);

  ros::spin();
}