library ieee;
use ieee.std_logic_1164.all;

entity countersync is
  port(rst,clk:in std_logic;
  q,qbar:inout std_logic_vector(3 downto 0));
end countersync;

architecture behavioral of countersync is
  component flipflop_J_K is
    port(
      j: in std_logic;
      k: in std_logic;
      clk: in std_logic;
      rst: in std_logic;
      q: out std_logic;
      qb: out std_logic);
  end component;
  signal i,j,k:std_logic;
  begin
    i<=q(0);
    j<=q(0) and q(1);
    k<=q(0) and q(1) and q(2);
    a1:flipflop_J_K port map('1','1',clk,rst,q(0),qbar(0));
    a2:flipflop_J_K port map(i,i,clk,rst,q(1),qbar(1));
    a3:flipflop_J_K port map(j,j,clk,rst,q(2),qbar(2));
    a4:flipflop_J_K port map(k,k,clk,rst,q(3),qbar(3));
end behavioral;
