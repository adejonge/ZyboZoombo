----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2022 05:54:23 PM
-- Design Name: 
-- Module Name: barcoder - Behavioral
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
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity barcoder is
  Port ( pxclk,resetn: in std_logic;
         greenseq,blueseq: in std_logic;
         hc: in std_logic_vector(10 downto 0));
end barcoder;

architecture Behavioral of barcoder is
type statetype is (start, greenfound,bluefound,bluefound2,blackbin,whitebin,tally1,tally2,tally3,tally4,done);
signal state,next_state: statetype;
signal hcgrab1,hcgrab2,hcdiff: std_logic_vector(10 downto 0);
signal hcwidth: integer range 0 to 1280;
begin

drive: process(pxclk,resetn)
begin
if resetn = '0' then
    state <= start;
elsif pxclk'event and pxclk = '1' then
    state <= next_state;
end if;
end process;

transitions: process(state,greenseq,blueseq)
begin
    case state is
        when start=>
            if greenseq ='1' then
                next_state <= greenfound;
            else
                next_state <= start;
            end if;
        when greenfound=>
            if blueseq ='1' then
                next_state <= bluefound;
            else
                next_state <= start;
            end if;
        when bluefound =>
                next_state <= bluefound2;
        when bluefound2 =>    
        when blackbin =>
        
        when whitebin =>
        when tally1=>
        when tally2=>
        when tally3=>
        when tally4=>
        when done=>
    end case;
end process;

data: process(state)
begin
    case state is
        when start=>
            hcgrab1 <= hc;
        when greenfound=>
            hcgrab2 <= hc;
        when bluefound =>
            hcwidth <= hcgrab2 - hcgrab
        when blackbin =>
        when whitebin =>
        when tally1=>
        when tally2=>
        when tally3=>
        when tally4=>
        when done=>
    end case;
end process;
end Behavioral;
