----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2022 10:07:31 AM
-- Design Name: 
-- Module Name: clkdiv_test - Behavioral
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

entity clkdiv_test is
--  Port ( );
end clkdiv_test;

architecture Behavioral of clkdiv_test is
component clkdiv is
 Port ( clk100mhz,resetn : in std_logic;
           clk200k : out std_logic);
end component clkdiv;
signal clk100mhz, resetn, clk200k: std_logic:='0';
begin
uut: clkdiv port map(clk100mhz=>clk100mhz,resetn=>resetn,clk200k=>clk200k);
clk100mhz <= not clk100mhz after 5ns;

process
begin
    resetn <= '1';
    wait for 5ns;
    resetn <= '0';
    wait;
end process;

end Behavioral;
