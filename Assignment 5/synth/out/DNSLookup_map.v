
// Generated by Cadence Encounter(R) RTL Compiler RC14.13 - v14.10-s027_1

// Verification Directory fv/DNSLookup 

module counter(clk, rst, en, count);
  input clk, rst, en;
  output [7:0] count;
  wire clk, rst, en;
  wire [7:0] count;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29;
  DFFHQX1 \count_reg[7] (.CK (clk), .D (n_29), .Q (count[7]));
  NOR2X1 g129(.A (rst), .B (n_28), .Y (n_29));
  DFFHQX1 \count_reg[6] (.CK (clk), .D (n_27), .Q (count[6]));
  AOI22X1 g131(.A0 (en), .A1 (n_26), .B0 (n_0), .B1 (count[7]), .Y
       (n_28));
  NOR2X1 g132(.A (rst), .B (n_25), .Y (n_27));
  XNOR2X1 g133(.A (count[7]), .B (n_21), .Y (n_26));
  AOI22X1 g134(.A0 (en), .A1 (n_23), .B0 (n_0), .B1 (count[6]), .Y
       (n_25));
  DFFHQX1 \count_reg[5] (.CK (clk), .D (n_24), .Q (count[5]));
  NOR2X1 g136(.A (rst), .B (n_22), .Y (n_24));
  XNOR2X1 g137(.A (count[6]), .B (n_17), .Y (n_23));
  AOI22X1 g138(.A0 (en), .A1 (n_19), .B0 (n_0), .B1 (count[5]), .Y
       (n_22));
  DFFHQX1 \count_reg[4] (.CK (clk), .D (n_20), .Q (count[4]));
  NAND2BX1 g140(.AN (n_17), .B (count[6]), .Y (n_21));
  NOR2X1 g141(.A (rst), .B (n_18), .Y (n_20));
  XNOR2X1 g142(.A (count[5]), .B (n_13), .Y (n_19));
  AOI22X1 g143(.A0 (en), .A1 (n_15), .B0 (n_0), .B1 (count[4]), .Y
       (n_18));
  DFFHQX1 \count_reg[3] (.CK (clk), .D (n_16), .Q (count[3]));
  NAND2BX1 g145(.AN (n_13), .B (count[5]), .Y (n_17));
  NOR2X1 g146(.A (rst), .B (n_14), .Y (n_16));
  XNOR2X1 g147(.A (count[4]), .B (n_9), .Y (n_15));
  AOI22X1 g148(.A0 (en), .A1 (n_11), .B0 (n_0), .B1 (count[3]), .Y
       (n_14));
  DFFHQX1 \count_reg[2] (.CK (clk), .D (n_12), .Q (count[2]));
  NAND2BX1 g150(.AN (n_9), .B (count[4]), .Y (n_13));
  NOR2X1 g151(.A (rst), .B (n_10), .Y (n_12));
  XNOR2X1 g152(.A (count[3]), .B (n_5), .Y (n_11));
  AOI22X1 g153(.A0 (en), .A1 (n_7), .B0 (n_0), .B1 (count[2]), .Y
       (n_10));
  DFFHQX1 \count_reg[1] (.CK (clk), .D (n_8), .Q (count[1]));
  NAND2BX1 g155(.AN (n_5), .B (count[3]), .Y (n_9));
  NOR2X1 g156(.A (rst), .B (n_6), .Y (n_8));
  XNOR2X1 g157(.A (count[2]), .B (n_1), .Y (n_7));
  AOI22X1 g158(.A0 (en), .A1 (n_2), .B0 (n_0), .B1 (count[1]), .Y
       (n_6));
  DFFQXL \count_reg[0] (.CK (clk), .D (n_4), .Q (count[0]));
  NAND2BX1 g160(.AN (n_1), .B (count[2]), .Y (n_5));
  NOR2X1 g161(.A (rst), .B (n_3), .Y (n_4));
  MX2XL g162(.A (n_0), .B (en), .S0 (count[0]), .Y (n_3));
  XOR2XL g163(.A (count[1]), .B (count[0]), .Y (n_2));
  NAND2X1 g164(.A (count[1]), .B (count[0]), .Y (n_1));
  INVX1 g165(.A (en), .Y (n_0));
endmodule

module decoder416(in, out, en);
  input [3:0] in;
  input en;
  output [15:0] out;
  wire [3:0] in;
  wire en;
  wire [15:0] out;
  wire n_1, n_2, n_3, n_4, n_5;
  assign out[4] = out[11];
  assign out[5] = out[11];
  assign out[6] = out[11];
  assign out[7] = out[11];
  assign out[8] = out[11];
  assign out[9] = out[11];
  assign out[10] = out[11];
  NOR2XL g113(.A (n_1), .B (n_3), .Y (out[15]));
  NOR2XL g114(.A (in[1]), .B (n_3), .Y (out[13]));
  AND2X1 g115(.A (n_2), .B (n_1), .Y (out[0]));
  AND2X1 g116(.A (n_2), .B (in[1]), .Y (out[2]));
  NOR2XL g117(.A (in[1]), .B (n_4), .Y (out[12]));
  NOR2XL g118(.A (n_1), .B (n_5), .Y (out[3]));
  NOR2XL g119(.A (n_1), .B (n_4), .Y (out[14]));
  NOR2XL g120(.A (in[1]), .B (n_5), .Y (out[1]));
  NAND2BXL g121(.AN (in[2]), .B (in[0]), .Y (n_5));
  NAND2BXL g122(.AN (in[0]), .B (in[2]), .Y (n_4));
  NAND2XL g123(.A (in[0]), .B (in[2]), .Y (n_3));
  NOR2XL g124(.A (in[2]), .B (in[0]), .Y (n_2));
  INVX1 g125(.A (in[1]), .Y (n_1));
  TIELO tie_0_cell(.Y (out[11]));
endmodule

module DNSLookup(clk, rst, client_req, web_addr, webpage_idx_out,
     tld_addr_out, domain_ip_out, web_ip_out, exec_time, ip_resolved,
     client_res, VDD, VSS);
  input clk, rst, client_req;
  input [7:0] web_addr;
  output [15:0] webpage_idx_out;
  output [7:0] tld_addr_out, domain_ip_out, web_ip_out, exec_time;
  output ip_resolved, client_res;
  inout VDD, VSS;
  wire clk, rst, client_req;
  wire [7:0] web_addr;
  wire [15:0] webpage_idx_out;
  wire [7:0] tld_addr_out, domain_ip_out, web_ip_out, exec_time;
  wire ip_resolved, client_res;
  wire VDD, VSS;
  wire [7:0] count;
  wire [3:0] web_ip_in;
  wire [15:0] webpage_idx;
  wire [4:0] state;
  wire [15:0] cached_ip_map;
  wire UNCONNECTED, UNCONNECTED0, UNCONNECTED1, UNCONNECTED2,
       UNCONNECTED3, UNCONNECTED4, UNCONNECTED5, UNCONNECTED6;
  wire count_en, count_rst, n_0, n_1, n_2, n_3, n_4, n_5;
  wire n_6, n_7, n_8, n_9, n_10, n_11, n_12, n_13;
  wire n_14, n_15, n_16, n_17, n_18, n_19, n_20, n_21;
  wire n_22, n_23, n_24, n_25, n_26, n_27, n_28, n_29;
  wire n_30, n_31, n_32, n_33, n_34, n_35, n_36, n_37;
  wire n_38, n_39, n_40, n_41, n_42, n_43, n_44, n_45;
  wire n_46, n_47, n_48, n_49, n_50, n_51, n_52, n_53;
  wire n_54, n_55, n_56, n_57, n_58, n_59, n_60, n_61;
  wire n_62, n_63, n_64, n_65, n_66, n_67, n_68, n_69;
  wire n_70, n_71, n_72, n_73, n_74, n_75, n_76, n_77;
  wire n_115, n_117, n_119, n_120, n_121, n_122, n_123, n_125;
  wire n_126, n_127;
  assign web_ip_out[2] = web_ip_out[3];
  assign web_ip_out[4] = webpage_idx_out[11];
  assign web_ip_out[5] = webpage_idx_out[11];
  assign domain_ip_out[6] = domain_ip_out[7];
  assign tld_addr_out[6] = webpage_idx_out[11];
  assign tld_addr_out[7] = webpage_idx_out[11];
  assign webpage_idx_out[4] = webpage_idx_out[11];
  assign webpage_idx_out[5] = webpage_idx_out[11];
  assign webpage_idx_out[6] = webpage_idx_out[11];
  assign webpage_idx_out[7] = webpage_idx_out[11];
  assign webpage_idx_out[8] = webpage_idx_out[11];
  assign webpage_idx_out[9] = webpage_idx_out[11];
  assign webpage_idx_out[10] = webpage_idx_out[11];
  counter ExecCounter(.clk (clk), .rst (count_rst), .en (count_en),
       .count (count));
  decoder416 WebIPToWebdata(.in ({webpage_idx_out[11],
       web_ip_in[2:0]}), .out ({webpage_idx[15:12], UNCONNECTED6,
       UNCONNECTED5, UNCONNECTED4, UNCONNECTED3, UNCONNECTED2,
       UNCONNECTED1, UNCONNECTED0, UNCONNECTED, webpage_idx[3:0]}), .en
       (webpage_idx_out[11]));
  INVX1 g1254(.A (domain_ip_out[3]), .Y (n_77));
  INVX1 g1255(.A (domain_ip_out[2]), .Y (n_76));
  AND2XL g1814(.A (domain_ip_out[5]), .B (web_ip_out[3]), .Y
       (web_ip_out[7]));
  AND2XL g1815(.A (domain_ip_out[4]), .B (web_ip_out[3]), .Y
       (web_ip_out[6]));
  NOR2BX1 g1816(.AN (web_ip_out[3]), .B (domain_ip_out[3]), .Y
       (web_ip_out[1]));
  NOR2BX1 g1817(.AN (web_ip_out[3]), .B (domain_ip_out[2]), .Y
       (web_ip_out[0]));
  NOR2X1 g1818(.A (tld_addr_out[3]), .B (n_64), .Y (domain_ip_out[3]));
  NOR2X1 g1819(.A (tld_addr_out[2]), .B (n_64), .Y (domain_ip_out[2]));
  NOR2XL g1820(.A (tld_addr_out[1]), .B (n_64), .Y (domain_ip_out[1]));
  NOR2XL g1821(.A (tld_addr_out[0]), .B (n_64), .Y (domain_ip_out[0]));
  NOR2XL g1822(.A (tld_addr_out[5]), .B (n_64), .Y (domain_ip_out[5]));
  NOR2XL g1823(.A (tld_addr_out[4]), .B (n_64), .Y (domain_ip_out[4]));
  AND2XL g1824(.A (webpage_idx[14]), .B (n_74), .Y
       (webpage_idx_out[14]));
  AND2XL g1825(.A (webpage_idx[13]), .B (n_74), .Y
       (webpage_idx_out[13]));
  NOR2BX1 g1826(.AN (web_addr[6]), .B (n_75), .Y (tld_addr_out[4]));
  AND2XL g1827(.A (webpage_idx[12]), .B (n_74), .Y
       (webpage_idx_out[12]));
  NOR2BX1 g1828(.AN (web_addr[5]), .B (n_75), .Y (tld_addr_out[3]));
  NOR2BX1 g1829(.AN (web_addr[4]), .B (n_75), .Y (tld_addr_out[2]));
  AND2XL g1830(.A (webpage_idx[3]), .B (n_74), .Y (webpage_idx_out[3]));
  NOR2BX1 g1831(.AN (web_addr[3]), .B (n_75), .Y (tld_addr_out[1]));
  NOR2BX1 g1832(.AN (web_addr[2]), .B (n_75), .Y (tld_addr_out[0]));
  AND2XL g1833(.A (webpage_idx[1]), .B (n_74), .Y (webpage_idx_out[1]));
  AND2XL g1834(.A (webpage_idx[2]), .B (n_74), .Y (webpage_idx_out[2]));
  AND2XL g1835(.A (webpage_idx[15]), .B (n_74), .Y
       (webpage_idx_out[15]));
  AND2XL g1836(.A (webpage_idx[0]), .B (n_74), .Y (webpage_idx_out[0]));
  NOR2BX1 g1837(.AN (web_addr[7]), .B (n_75), .Y (tld_addr_out[5]));
  DFFHQX1 \exec_time_reg[7] (.CK (clk), .D (n_65), .Q (exec_time[7]));
  DFFHQX1 \exec_time_reg[6] (.CK (clk), .D (n_66), .Q (exec_time[6]));
  DFFHQX1 \exec_time_reg[5] (.CK (clk), .D (n_68), .Q (exec_time[5]));
  DFFHQX1 \exec_time_reg[4] (.CK (clk), .D (n_67), .Q (exec_time[4]));
  DFFHQX1 \exec_time_reg[3] (.CK (clk), .D (n_69), .Q (exec_time[3]));
  DFFHQX1 \exec_time_reg[2] (.CK (clk), .D (n_70), .Q (exec_time[2]));
  DFFHQX1 \exec_time_reg[1] (.CK (clk), .D (n_71), .Q (exec_time[1]));
  DFFHQX1 \exec_time_reg[0] (.CK (clk), .D (n_72), .Q (exec_time[0]));
  DFFHQX1 count_en_reg(.CK (clk), .D (n_63), .Q (count_en));
  DFFHQX1 count_rst_reg(.CK (clk), .D (n_62), .Q (count_rst));
  NOR2X1 g1848(.A (n_56), .B (n_61), .Y (n_75));
  NOR2X1 g1849(.A (rst), .B (n_73), .Y (n_121));
  NOR2BX1 g1850(.AN (n_73), .B (rst), .Y (n_120));
  NOR3X1 g1851(.A (rst), .B (n_125), .C (ip_resolved), .Y (n_123));
  NOR3BX1 g1852(.AN (ip_resolved), .B (rst), .C (n_125), .Y (n_122));
  AOI22XL g1853(.A0 (n_55), .A1 (n_60), .B0 (n_115), .B1 (n_117), .Y
       (n_74));
  NAND2X1 g1854(.A (ip_resolved), .B (client_res), .Y (n_73));
  NOR2BX1 g1855(.AN (count[0]), .B (n_60), .Y (n_72));
  NOR2BX1 g1856(.AN (count[1]), .B (n_60), .Y (n_71));
  NOR2BX1 g1857(.AN (count[2]), .B (n_60), .Y (n_70));
  NOR2BX1 g1858(.AN (count[3]), .B (n_60), .Y (n_69));
  NOR2BX1 g1859(.AN (count[5]), .B (n_60), .Y (n_68));
  NOR2BX1 g1860(.AN (count[4]), .B (n_60), .Y (n_67));
  NOR2BX1 g1861(.AN (count[6]), .B (n_60), .Y (n_66));
  NAND2BXL g1862(.AN (n_126), .B (n_59), .Y (web_ip_out[3]));
  NOR2BX1 g1863(.AN (count[7]), .B (n_60), .Y (n_65));
  INVX1 g1864(.A (domain_ip_out[7]), .Y (n_64));
  OAI211X1 g1865(.A0 (n_57), .A1 (n_58), .B0 (n_55), .C0 (n_59), .Y
       (domain_ip_out[7]));
  INVX1 g1866(.A (n_62), .Y (n_63));
  NOR4X1 g1867(.A (client_req), .B (state[3]), .C (state[2]), .D
       (n_127), .Y (n_62));
  OAI211X1 g1868(.A0 (state[3]), .A1 (n_117), .B0 (n_58), .C0 (n_59),
       .Y (n_61));
  AOI31X1 g1869(.A0 (state[1]), .A1 (n_53), .A2 (n_56), .B0 (rst), .Y
       (n_125));
  INVX1 g1870(.A (n_60), .Y (client_res));
  NAND2BX1 g1871(.AN (n_59), .B (state[2]), .Y (n_60));
  OAI21X1 g1872(.A0 (n_117), .A1 (n_58), .B0 (n_55), .Y (n_126));
  NAND2X1 g1873(.A (state[3]), .B (n_57), .Y (n_59));
  NAND2X1 g1874(.A (state[0]), .B (state[1]), .Y (n_117));
  INVX1 g1875(.A (n_58), .Y (n_119));
  NAND2X1 g1876(.A (state[2]), .B (n_54), .Y (n_58));
  NAND2X1 g1877(.A (state[3]), .B (state[2]), .Y (n_115));
  INVX1 g1878(.A (n_57), .Y (n_127));
  NOR2X1 g1879(.A (state[0]), .B (state[1]), .Y (n_57));
  INVX1 g1880(.A (n_56), .Y (n_55));
  NOR2X1 g1881(.A (state[2]), .B (n_54), .Y (n_56));
  DFFHQX1 ip_resolved_reg(.CK (clk), .D (n_49), .Q (ip_resolved));
  OAI21X1 g1979(.A0 (rst), .A1 (n_38), .B0 (n_47), .Y (n_49));
  OAI222X1 g1981(.A0 (n_40), .A1 (n_45), .B0 (n_43), .B1 (state[0]),
       .C0 (rst), .C1 (n_37), .Y (n_48));
  OAI211X1 g1982(.A0 (n_45), .A1 (n_35), .B0 (n_38), .C0 (ip_resolved),
       .Y (n_47));
  AO22XL g1983(.A0 (n_39), .A1 (n_45), .B0 (n_41), .B1 (n_126), .Y
       (n_46));
  NOR4X1 g1985(.A (n_8), .B (n_13), .C (n_14), .D (n_1), .Y (n_45));
  OAI21X1 g1986(.A0 (n_43), .A1 (n_15), .B0 (n_40), .Y (n_44));
  DFFQXL \state_reg[2] (.CK (clk), .D (n_42), .Q (state[2]));
  NAND2X1 g1988(.A (n_41), .B (n_115), .Y (n_43));
  NOR2BX1 g1989(.AN (n_41), .B (n_32), .Y (n_42));
  NOR3BX1 g1991(.AN (n_35), .B (rst), .C (n_29), .Y (n_41));
  DFFHQX1 \web_ip_in_reg[0] (.CK (clk), .D (n_34), .Q (web_ip_in[0]));
  DFFHQX1 \web_ip_in_reg[1] (.CK (clk), .D (n_33), .Q (web_ip_in[1]));
  DFFHQX1 \web_ip_in_reg[2] (.CK (clk), .D (n_36), .Q (web_ip_in[2]));
  INVX1 g1995(.A (n_39), .Y (n_40));
  NOR2X1 g1996(.A (rst), .B (n_35), .Y (n_39));
  AOI31X1 g1997(.A0 (state[0]), .A1 (state[3]), .A2 (n_10), .B0 (rst),
       .Y (n_38));
  DFFQXL \cached_ip_map_reg[6] (.CK (clk), .D (n_28), .Q
       (cached_ip_map[6]));
  DFFQXL \cached_ip_map_reg[0] (.CK (clk), .D (n_26), .Q
       (cached_ip_map[0]));
  DFFQXL \cached_ip_map_reg[1] (.CK (clk), .D (n_23), .Q
       (cached_ip_map[1]));
  DFFQXL \cached_ip_map_reg[5] (.CK (clk), .D (n_16), .Q (n_50));
  DFFQXL \cached_ip_map_reg[7] (.CK (clk), .D (n_24), .Q
       (cached_ip_map[7]));
  DFFQXL \cached_ip_map_reg[2] (.CK (clk), .D (n_22), .Q
       (cached_ip_map[2]));
  DFFQXL \cached_ip_map_reg[4] (.CK (clk), .D (n_19), .Q (n_51));
  DFFQXL \cached_ip_map_reg[3] (.CK (clk), .D (n_21), .Q
       (cached_ip_map[3]));
  DFFHQX1 \cached_ip_map_reg[10] (.CK (clk), .D (n_0), .Q (n_52));
  NAND2X1 g2007(.A (client_req), .B (n_29), .Y (n_37));
  NAND2BX1 g2008(.AN (n_122), .B (n_17), .Y (n_36));
  NAND3BXL g2009(.AN (state[2]), .B (state[1]), .C (n_9), .Y (n_35));
  OAI2BB1X1 g2010(.A0N (n_123), .A1N (n_51), .B0 (n_25), .Y (n_34));
  OAI2BB1X1 g2011(.A0N (n_123), .A1N (n_50), .B0 (n_27), .Y (n_33));
  AOI211XL g2012(.A0 (n_4), .A1 (n_119), .B0 (n_9), .C0 (n_11), .Y
       (n_32));
  AOI221X1 g2013(.A0 (web_addr[6]), .A1 (n_5), .B0 (web_addr[5]), .B1
       (n_2), .C0 (n_20), .Y (n_31));
  OAI221X1 g2015(.A0 (web_addr[5]), .A1 (n_2), .B0 (web_addr[6]), .B1
       (n_5), .C0 (n_18), .Y (n_30));
  NOR3X1 g2016(.A (state[3]), .B (state[2]), .C (n_127), .Y (n_29));
  AO22XL g2018(.A0 (web_addr[6]), .A1 (n_121), .B0 (n_120), .B1
       (cached_ip_map[6]), .Y (n_28));
  AOI22X1 g2019(.A0 (n_77), .A1 (n_122), .B0 (n_125), .B1
       (web_ip_in[1]), .Y (n_27));
  AO22XL g2020(.A0 (web_addr[0]), .A1 (n_121), .B0 (n_120), .B1
       (cached_ip_map[0]), .Y (n_26));
  AOI22X1 g2021(.A0 (n_76), .A1 (n_122), .B0 (n_125), .B1
       (web_ip_in[0]), .Y (n_25));
  AO22XL g2022(.A0 (web_addr[7]), .A1 (n_121), .B0 (n_120), .B1
       (cached_ip_map[7]), .Y (n_24));
  AO22XL g2023(.A0 (web_addr[1]), .A1 (n_121), .B0 (n_120), .B1
       (cached_ip_map[1]), .Y (n_23));
  AO22XL g2024(.A0 (web_addr[2]), .A1 (n_121), .B0 (n_120), .B1
       (cached_ip_map[2]), .Y (n_22));
  AO22XL g2025(.A0 (web_addr[3]), .A1 (n_121), .B0 (n_120), .B1
       (cached_ip_map[3]), .Y (n_21));
  OAI22X1 g2026(.A0 (n_3), .A1 (cached_ip_map[7]), .B0 (n_6), .B1
       (n_51), .Y (n_20));
  AO22XL g2027(.A0 (web_addr[4]), .A1 (n_121), .B0 (n_120), .B1 (n_51),
       .Y (n_19));
  AOI22X1 g2028(.A0 (n_6), .A1 (n_51), .B0 (n_3), .B1
       (cached_ip_map[7]), .Y (n_18));
  AOI22X1 g2029(.A0 (n_123), .A1 (n_52), .B0 (n_125), .B1
       (web_ip_in[2]), .Y (n_17));
  AO22XL g2030(.A0 (web_addr[5]), .A1 (n_121), .B0 (n_120), .B1 (n_50),
       .Y (n_16));
  MX2XL g2031(.A (n_4), .B (state[1]), .S0 (state[0]), .Y (n_15));
  XOR2XL g2032(.A (web_addr[0]), .B (cached_ip_map[0]), .Y (n_14));
  XOR2XL g2033(.A (web_addr[3]), .B (cached_ip_map[3]), .Y (n_13));
  XNOR2X1 g2034(.A (web_addr[1]), .B (cached_ip_map[1]), .Y (n_12));
  NOR2X1 g2035(.A (state[2]), .B (n_117), .Y (n_11));
  NOR2X1 g2036(.A (state[1]), .B (state[2]), .Y (n_10));
  NOR2X1 g2037(.A (state[0]), .B (state[3]), .Y (n_9));
  NOR2BX1 g2038(.AN (cached_ip_map[2]), .B (web_addr[2]), .Y (n_8));
  NAND2BXL g2039(.AN (cached_ip_map[2]), .B (web_addr[2]), .Y (n_7));
  INVX1 g2040(.A (web_addr[4]), .Y (n_6));
  INVX1 g2041(.A (cached_ip_map[6]), .Y (n_5));
  INVX1 g2043(.A (web_addr[7]), .Y (n_3));
  INVX1 g2045(.A (n_50), .Y (n_2));
  NAND4BX1 g2(.AN (n_30), .B (n_7), .C (n_12), .D (n_31), .Y (n_1));
  AO21X1 g2046(.A0 (n_120), .A1 (n_52), .B0 (n_121), .Y (n_0));
  DFFX1 \state_reg[3] (.CK (clk), .D (n_46), .Q (state[3]), .QN (n_54));
  DFFX1 \state_reg[0] (.CK (clk), .D (n_48), .Q (state[0]), .QN (n_53));
  DFFX1 \state_reg[1] (.CK (clk), .D (n_44), .Q (state[1]), .QN (n_4));
  TIELO tie_0_cell(.Y (webpage_idx_out[11]));
endmodule

