-------------------------------------------------------------------------------
-- Jaric Sloan 
-- Lab2
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity top is
  port (
    clk              : in  std_logic; 
    reset            : in  std_logic;
    enable           : in  std_logic;
    period           : in  std_logic_vector(25 DOWNTO 0);
    duty             : in  std_logic_vector(25 DOWNTO 0);
    output           : out std_logic
  );
end top;

architecture beh of top is

component lab2 is
  port (
    clk              : in  std_logic; 
    reset            : in  std_logic;
    enable           : in  std_logic;
    period           : in  std_logic_vector(25 DOWNTO 0);
    duty             : in  std_logic_vector(25 DOWNTO 0);
    output           : out std_logic
  );  
end component;  

begin

uut: lab2
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable,
    period    => period,
    duty      => duty,
    output    => output
  );
end beh;