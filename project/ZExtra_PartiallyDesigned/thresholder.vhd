----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2022 12:17:10 PM
-- Design Name: 
-- Module Name: thresholder - Behavioral
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
use ieee.std_logic_unsigned.all;
entity thresholder is
    Port ( px : in STD_LOGIC_VECTOR (3 downto 0);
           bin_px: out STD_LOGIC);
end thresholder;

architecture Behavioral of thresholder is

begin
bin_px <= '1' when px > "0111" else '0';

end Behavioral;
