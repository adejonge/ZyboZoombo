----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2022 05:11:43 PM
-- Design Name: 
-- Module Name: registerN - Behavioral
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

ENTITY registerN IS 
GENERIC(N: integer:= 8);
PORT(
    d   : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
    ld  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock.
    q   : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0) -- output
);
END registerN;

ARCHITECTURE description OF registerN IS

BEGIN
    process(clk, clr)
    begin
        if clr = '1' then
            q <= (others => '0');
        elsif rising_edge(clk) then
            if ld = '1' then
                q <= d;
            end if;
        end if;
    end process;
END description;