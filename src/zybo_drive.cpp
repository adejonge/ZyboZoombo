#include <std_msgs/Float64.h>
#include <ros/ros.h>

const double WHEEL_LENGTH =  0.1524; //6in to m
const int MIDDLE_SERVO_VAL = 75;
const int TICK_TIMER_FREQ_HZ = 60;
const float deltaT = 1000.0/TICK_TIMER_FREQ_HZ;
/*current measurements:
WHEEL_LENGTH: 0.1524m

*/
//GAMMA is the constant relating steering wheel angle 
//  (in our case, servo angle) to tire angle
const double GAMMA = 60;


//global variables used for time derivative/integral calculations
float errorPrev = 0;
float e_i, e_d = 0;


ros::Publisher steering_cmd;
ros::Publisher cmd_vel;

void timerCallback(const ros::TimerEvent& event){
  const float* pos = (const float *)0x412F0000;
  const float* target = (const float *)0x412F0004;
  const float* kp = (const float *)0x412F0008;
  const float* ki = (const float *)0x412F000C;
  const float* kd = (const float *)0x412F0010;

  int* ServoOutput = (int *)0x41200000;
  int* MotorOutput = (int *)0x41200004;
  int ServoVal;

  float error;
  float u;
  
  //    float kp = 0.0, ki=0.0, kd=0.0;
  //    float error=0. , deltaT = ((1.0/(TICK_TIMER_FREQ_HZ))*1000.) ;
  //    float e_i=0. , e_d = 0.;
  //    int target = width/2, pos=0;

    //we already have a delta T, which is based on the frequency of the timer ticker.
    error = pos - target;
    //error = pos - target;

    //integral
    e_i = e_i + (error*deltaT);
    //derivative
    e_d = (error - errorPrev) / deltaT;

    //control signal
        //proportional + integral + derivative
    u = (*kp * error) + (*ki * e_i) + (*kd * e_d);

    errorPrev = error;

  
  
  //Calculate actual servo value to send to controller
  //  furthest left value is 31, furthest right is 119
  ServoVal = MIDDLE_SERVO_VAL + (int)u;

  if(ServoVal<30){
    ServoVal = 31;
  }else if(ServoVal>120){
    ServoVal=119;
  }
  //Do actual write to memory at the end to avoid controller
  //  grabbing incorrect value and to reduce time spent accessing memory
  *ServoOutput = ServoVal;
  *MotorOutput = 2.0;

}


int main(int argc, char** argv){
  ros::init(argc,argv,"zybo_drive");
  ros::NodeHandle zybo_drive;

  ros::Timer marker_timer = zybo_drive.createTimer(ros::Duration(60), timerCallback);

  ros::spin();
}