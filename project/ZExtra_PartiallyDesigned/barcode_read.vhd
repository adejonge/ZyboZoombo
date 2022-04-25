----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2022 12:20:04 PM
-- Design Name: 
-- Module Name: barcode_read - Behavioral
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

entity barcode_read is
  Port (clk,clr: in std_logic;
  px_data: in std_logic);
end barcode_read;

architecture Behavioral of barcode_read is
type statetype is (start, one, onetwo, zero, zerotwo,size);
signal present_state, next_state: statetype;
signal width,width2,width3 : integer range 0 to 32;
begin

drive: process(clk,clr)
begin
    if clr = '1' then
        present_state <= start;
    elsif clk'event and clk = '1' then
        present_state <= next_state;
    end if; 
end process;

transitions: process(present_state)
begin
    case present_state is
        when start=> 
               width <= 0;
            if px_data = '1' then 
                next_state <= one;
                
            else
                next_state <= start;
            end if;
        when one=>
            width <= 1;
            if px_data = '1' then 
                        next_state <= onetwo;
                        
                    else
                        next_state <= start;
            end if;
        when onetwo =>
               width <= width + 1; 
            if px_data = '1' then 
                next_state <= onetwo;               
            else
                next_state <= zero;
            end if;
        when zero=>
        width2 <= width;
            if px_data = '1' then 
                  next_state <= onetwo;
                  width <= width + 1;                     
            else
                  next_state <= zerotwo;
            end if;
        when zerotwo=>
            if px_data = '0' then 
                          next_state <= zerotwo;
                          width3 <= width3 + 1;    
                          width2 <= width2 - 1;                 
                    else
                          next_state <= zerotwo;
                    end if;
        when size=>
    end case;
end process;

end Behavioral;
