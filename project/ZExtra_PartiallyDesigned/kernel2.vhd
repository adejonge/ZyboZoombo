----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2022 05:51:04 PM
-- Design Name: 
-- Module Name: kernel2 - Behavioral
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

entity kernel2 is
    generic(N:integer:= 8);
  Port (s1,s2,s3: in std_logic_vector(N-1 downto 0);
        n1,n2,n3: out std_logic_vector(N-1 downto 0);
        clk,clr,Shift: in std_logic;
        OperationOut: out std_logic_vector(N-1 downto 0) );
end kernel2;

architecture Behavioral of kernel2 is
signal r6out,r7out,r8out,r3out,r4out,r5out: std_logic_vector(N-1 downto 0);

component registerN IS 
GENERIC(N: integer:= 8);
PORT(
    d   : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
    ld  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock.
    q   : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0) -- output
);
END component registerN;
begin

R2: registerN port map( d => r5out,ld => shift,clr=>clr,clk=>clk,q=>n3);
R1: registerN port map( d => r4out,ld => shift,clr=>clr,clk=>clk,q=>n2);
R0: registerN port map( d => r3out,ld => shift,clr=>clr,clk=>clk,q=>n1);

R5: registerN port map( d => r8out,ld => shift,clr=>clr,clk=>clk,q=>r5out);
R4: registerN port map( d => r7out,ld => shift,clr=>clr,clk=>clk,q=>r4out);
R3: registerN port map( d => r6out,ld => shift,clr=>clr,clk=>clk,q=>r3out);

R8: registerN port map( d => s3,ld => shift,clr=>clr,clk=>clk,q=>r8out);
R7: registerN port map( d => s2,ld => shift,clr=>clr,clk=>clk,q=>r7out);
R6: registerN port map( d => s1,ld => shift,clr=>clr,clk=>clk,q=>r6out);

--add math here, defaults to pixel passthrough
OperationOut <= r4out;

--blur filter.
--center_removed <= q(4) + q(7) when pxrowsel = "00" else q(1) + q(7) when pxrowsel = "01" else
--q(1) + q(4) when pxrowsel = "10";
----blur pixel
--blurredPxBase <= q(0) + q(2) + q(3) + q(5) + q(6) + q(8) + center_removed;
--blurredPx <= blurredPxBase(10 downto 3);
end Behavioral;
