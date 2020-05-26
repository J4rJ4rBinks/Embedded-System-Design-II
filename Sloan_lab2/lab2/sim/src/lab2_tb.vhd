-------------------------------------------------------------------------------
-- Jaric Sloan
-- Lab2
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity lab2_tb is
end lab2_tb;

architecture arch of lab2_tb is

component lab2 is
  port (
    clk             : in  std_logic; 
    reset           : in  std_logic;
    enable          : in  std_logic; 
    period          : in  std_logic_vector(25 DOWNTO 0);
    duty            : in  std_logic_vector(25 DOWNTO 0); 
    output          : out std_logic
  );  
end component;  

constant tb_period  : time := 20ns;  -- 50MHz clock

signal clk            : std_logic := '0'; -- same to blink_tb
signal reset          : std_logic := '1'; -- same to blink_tb 
signal enable_sig     : std_logic := '0'; -- start as zero

signal zero_percentage        : std_logic;
signal five_percentage        : std_logic;
signal ten_percentage         : std_logic;
signal fifteen_percentage     : std_logic;
signal twenty_percentage  	  : std_logic; 
signal twentyfive_percentage  : std_logic;
signal thirty_percentage  	  : std_logic; 
signal thirtyfive_percentage  : std_logic; 
signal fourty_percentage  	  : std_logic; 
signal fourtyfive_percentage  : std_logic; 
signal fifty_percentage       : std_logic;
signal fiftyfive_percentage   : std_logic;
signal sixty_percentage       : std_logic;
signal sixtyfive_percentage   : std_logic;
signal seventy_percentage     : std_logic;
signal seventyfive_percentage : std_logic;
signal eighty_percentage      : std_logic;
signal eightyfive_percentage  : std_logic;
signal ninety_percentage       : std_logic;
signal ninetyfive_percentage  : std_logic;
signal hundred_percentage     : std_logic;


begin
-- clock process
clock: process -- same as blink_tb
  begin
    clk <= not clk;
    wait for tb_period/2;
end process; 
 
-- reset process
async_reset: process -- same as blink_tb 
  begin
    wait for 2 * tb_period;
    reset <= '0';
    wait;
end process; 

-- enable process
enable: process
  begin
    wait for 1ms; -- wait for one milliseconds
    enable_sig <= '1'; 
    -- disable
    wait for 4ms; -- wait for four milliseconds 
    enable_sig <= '0'; 
end process; 


uut0: lab2 
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000000000000000",  --0 percent
    output    => zero_percentage
  );

uut1: lab2  
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000000000110010",  --5 percent
    output    => five_percentage
  );

uut2: lab2   
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000000001100100",  --10 percent 
    output    => ten_percentage
  );

uut3: lab2  
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000000010010110",  --15 percent 
    output    => fifteen_percentage
  );

uut4: lab2   
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000000011001000",  --20 percent 
    output    => twenty_percentage
  );
  
uut5: lab2 
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000000011111010",  --25 percent 
    output    => twentyfive_percentage
  );

uut6: lab2  
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000000100101100",  --30 percent 
    output    => thirty_percentage
  );
  
uut7: lab2 
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000000101011110",  --35 percent 
    output    => thirtyfive_percentage
  );
  
uut8: lab2 
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000000110010000",  --40 percent 
    output    => fourty_percentage
  );
  
uut9: lab2 
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000000111000010",  --45 percent 
    output    => fourtyfive_percentage
  );
  
  
uut10: lab2 
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000000111110100",  --50 percent 
    output    => fifty_percentage
  ); 
  
uut11: lab2 
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000001000100110",  --55 percent 
    output    => fiftyfive_percentage
  ); 
uut12: lab2 
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000001001011000",  --60 percent 
    output    => sixty_percentage
  ); 
  
uut13: lab2 
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000001010001010",  --65 percent 
    output    => sixtyfive_percentage
  ); 
  
uut14: lab2 
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000001010111100",  --70 percent 
    output    => seventy_percentage
  ); 

uut15: lab2  
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000001011101110",  --75 percent 
    output    => seventyfive_percentage
  );
uut16: lab2   
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000001100100000",  --80 percent 
    output    => eighty_percentage
  );
  
uut17: lab2   
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000001101010010",  --85 percent 
    output    => eightyfive_percentage
  );
  
uut18: lab2  
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000001110000100",  --90 percent 
    output    => ninety_percentage
  );
uut19: lab2  
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000001110110110",  --95 percent
    output    => ninetyfive_percentage
  );
uut20: lab2  
  port map(
    clk       => clk,
    reset     => reset,
    enable    => enable_sig,
    period    => "00000000000000001111101000",  --1000
    duty      => "00000000000000001111101000",  --100 percent
    output    => hundred_percentage
  );
end arch;