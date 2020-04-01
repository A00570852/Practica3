library ieee;
use ieee.std_logic_1164.all;

entity decadecountert99 is
  port (
    clk:in std_logic;
    reset: in std_logic;
    q: out std_logic_vector(3 downto 0)
    );
end decadecountert99;

architecture equations of decadecountert99 is
begin
  process(clk,reset)
  variable qtemp: std_logic_vector(3 downto 0);
  begin
    if reset='1' then
    qtemp:="0000";
    q<="0000";
    elsif clk'event and clk='1' then
    if qtemp<9 then
    qtemp:=qtemp+1;
    else
    qtemp:="0000";
    end if;
    q<=qtemp;
    end if;
  end process;
end equations;
