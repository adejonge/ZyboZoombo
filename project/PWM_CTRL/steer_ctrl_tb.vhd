----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2022 10:40:27 AM
-- Design Name: 
-- Module Name: steer_ctrl_tb - Behavioral
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

entity steer_ctrl_tb is
--  Port ( );
end steer_ctrl_tb;

architecture Behavioral of steer_ctrl_tb is
component steer_ctrl is
    Port ( steer_val : in STD_LOGIC_VECTOR (7 downto 0);
           clk200khz,resetn : in STD_LOGIC;
           pwm_out : out STD_LOGIC);
end component steer_ctrl;

signal steer_val: std_logic_vector(7 downto 0);
signal resetn,pwm_out: std_logic;
signal clk200khz: std_logic:= '0';
begin

uut: steer_ctrl port map(steer_val=>steer_val,resetn=>resetn,pwm_out=>pwm_out,clk200khz=>clk200khz);

clk200khz <= not clk200khz after 2500ns;

process
begin
    resetn <= '1';
    steer_val <= X"64";
    wait for 5us;
    resetn <= '0';
    wait;
end process;
end Behavioral;
