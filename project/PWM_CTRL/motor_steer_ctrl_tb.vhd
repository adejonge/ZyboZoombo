----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2022 11:37:56 AM
-- Design Name: 
-- Module Name: motor_steer_ctrl_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity motor_steer_ctrl_tb is
--  Port ( );
end motor_steer_ctrl_tb;

architecture Behavioral of motor_steer_ctrl_tb is
component motor_ctrl is
  Port ( clk100mhz,resetn : in std_logic;
        motor_val: in std_logic_vector(7 downto 0);
         pwm_out: out std_logic);
end component motor_ctrl;
component steer_controller is
    Port ( clk100mhz,resetn : in STD_LOGIC;
           steer_val : in STD_LOGIC_VECTOR (7 downto 0);
           pwm_out : out STD_LOGIC);
end component steer_controller;
signal clk100mhz: std_logic:='0';
signal resetn: std_logic;
signal steer_val,motor_val: std_logic_vector(7 downto 0);
signal pwm_out_steer,pwm_out_motor: std_logic;
begin
uut: motor_ctrl port map(clk100mhz=>clk100mhz,resetn=>resetn,motor_val=>motor_val, pwm_out=>pwm_out_motor);
uut2: steer_controller port map(clk100mhz=>clk100mhz,resetn=>resetn,steer_val=>steer_val,pwm_out=>pwm_out_steer);

clk100mhz <= not clk100mhz after 5ns;

stim:process
begin 
resetn <= '1';
steer_val <= X"64";
motor_val <= X"64";
wait for 5ns;
resetn <= '0';

wait for 20ms;
steer_val <= X"C8";
motor_val <= X"C8";
wait for 20ms;

steer_val <= X"00";
motor_val <= X"00";
wait for 20ms;

steer_val <= X"33";
motor_val <= X"33";
wait for 20ms;
steer_val <= X"A1";
motor_val <= X"A1";
wait;
end process;

end Behavioral;
