-------------------------------------------------------------------------------
-- Jaric Sloan 
-- Lab2
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity lab2 is
  port (
    clk             : in  std_logic; 
    reset           : in  std_logic;
    enable          : in  std_logic;
    period          : in  std_logic_vector(25 DOWNTO 0);
    duty            : in  std_logic_vector(25 DOWNTO 0);
    output          : out std_logic  
  );
end lab2;

architecture beh of lab2  is

constant clk_freq   : integer := 50000000;  -- 50MHz
constant clk_period : time := 20ns; -- 50Mhz

signal count_sig    : integer range 0 to clk_freq := 0;  --same as blink 
signal output_sig   : std_logic; -- same as blink 
signal enable_sig   : std_logic;

begin
process(clk,reset)
  constant duty_zeros    : std_logic_vector(duty'range) := (others => '0'); -- whatever is in duty range and then the rest are zeros
  variable ticks_period : integer := clk_freq/to_integer(unsigned(period));  -- to find the ticks of the period
  begin
    if (reset = '1') then  -- if reset then all is zero, same as blink 
      count_sig <= 0;
      output_sig <= '0';
    elsif (clk'event and clk = '1') then
      if (enable_sig = '1') then -- if enable is on then do this
        if (period = duty) then -- if period is same as duty then output will be one high 
          output_sig <= '1'; -- ouput_sig will be high 
        elsif (duty = duty_zeros) then -- otherwise its is zero 
          output_sig <= '0';
        else
          if (count_sig <= (to_integer(unsigned(duty)) * (ticks_period/(to_integer(unsigned(period)))))) then  
            output_sig <= '1'; -- will be high 
          else
            output_sig <= '0'; -- will be low 
          end if;
          if (count_sig = ticks_period) then
            count_sig <= 0; -- will be low 
            output_sig <= not output_sig; -- opposite of count_sig
          else
            count_sig <= count_sig + 1; -- increments 
          end if;
        end if;
      end if;
    end if;
  end process;
  enable_sig <= enable;
  output <= output_sig; -- output depends on the high and low from if statements
end beh;