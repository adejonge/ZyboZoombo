----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2022 05:10:49 PM
-- Design Name: 
-- Module Name: kernel - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity kernel is
    Port ( clk,clr: in std_logic;
    pxrowsel: in STD_LOGIC_vector(1 downto 0);
    in1,in2,in3 : in STD_LOGIC_VECTOR (7 downto 0));
end kernel;

architecture Behavioral of kernel is
component registerN IS 
GENERIC(N: integer:= 12);
PORT(
    
    d   : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
    ld  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock.
    q   : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0) -- output
);
END component registerN;

type arr98 is array (8 downto 0) of std_logic_vector(7 downto 0);
signal D : arr98;
signal Q: arr98;
--emb blur filter
signal blurredPxBase:  std_logic_vector(10 downto 0);
signal blurredPx: std_logic_vector(7 downto 0);
signal center_removed: std_logic_vector(8 downto 0);

type arr91 is array (8 downto 0) of std_logic;
signal E: arr91;
begin

gen: for i in 0 to 8 generate
r1: registerN port map (d =>d(i),ld=>E(i), clk=>clk,clr=>clr,q=>q(i));
end generate;

center_removed <= q(4) + q(7) when pxrowsel = "00" else q(1) + q(7) when pxrowsel = "01" else
q(1) + q(4) when pxrowsel = "10";
--blur pixel
blurredPxBase <= q(0) + q(2) + q(3) + q(5) + q(6) + q(8) + center_removed;
blurredPx <= blurredPxBase(10 downto 3);

end Behavioral;
