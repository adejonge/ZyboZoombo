#include <geometry_msgs/Twist.h>
#include <std_msgs/Float64.h>
#include <ros/ros.h>

const double WHEEL_LENGTH =  0.1524; //6in to m
/*current measurements:
WHEEL_LENGTH: 0.1524m

*/
//GAMMA is the constant relating steering wheel angle 
//  (in our case, servo angle) to tire angle
const double GAMMA = 700;

ros::Publisher steering_cmd;
ros::Publisher cmd_vel;

void recvTwist(const geometry_msgs::TwistConstPtr& msg){
  double v = msg->linear.x;
  double psi_dot = msg->angular.z;

  geometry_msgs::Twist vel;
  std_msgs::Float64 steering;

  vel.linear.x = v;
  steering.data = GAMMA*atan((WHEEL_LENGTH*psi_dot)/v);

  cmd_vel.publish(vel);
  steering_cmd.publish(steering);

}

int main(int argc, char** argv){
  ros::init(argc,argv,"zybo_drive");
  ros::NodeHandle zybo_drive;

  cmd_vel = zybo_drive.advertise<geometry_msgs::Twist>("audibot/cmd_vel", 1);
  steering_cmd = zybo_drive.advertise<std_msgs::Float64>("audibot/steering_cmd", 1);

  ros::Subscriber sub_twist = zybo_drive.subscribe("twist_cmd", 1, recvTwist);

  ros::spin();
}