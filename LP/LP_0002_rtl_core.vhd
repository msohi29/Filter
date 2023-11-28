-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 20.1 (Release Build #711)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2020 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from LP_0002_rtl_core
-- VHDL created on Mon Nov 27 09:25:43 2023


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity LP_0002_rtl_core is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(15 downto 0);  -- sfix16
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(34 downto 0);  -- sfix35
        xOut_1 : out std_logic_vector(34 downto 0);  -- sfix35
        xOut_2 : out std_logic_vector(34 downto 0);  -- sfix35
        clk : in std_logic;
        areset : in std_logic
    );
end LP_0002_rtl_core;

architecture normal of LP_0002_rtl_core is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_wi0_r0_phasedelay0_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_phasedelay0_q_12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr1_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr1_q_12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr2_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr3_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr3_q_12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr4_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr4_q_12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr5_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr5_q_12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr6_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr6_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr6_q_12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr7_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr7_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr8_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr10_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr11_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr13_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr14_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr15_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr15_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr16_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr17_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr17_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr18_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr18_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr19_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr19_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr20_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr20_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr21_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr21_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr22_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr22_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr23_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm5_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_cm9_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_cm11_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_sym_add0_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add0_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add0_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal d_u0_m0_wo0_sym_add0_q_13_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add1_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add1_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add1_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal d_u0_m0_wo0_sym_add1_q_13_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add2_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add2_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add2_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add2_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add3_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add3_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add3_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add3_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add4_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add4_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add4_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add4_q : STD_LOGIC_VECTOR (16 downto 0);
    signal d_u0_m0_wo0_sym_add4_q_12_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add5_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add5_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add5_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add5_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add6_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add6_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add6_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add6_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add7_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add7_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add7_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add7_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add8_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add8_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add8_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add8_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add9_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add9_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add9_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add9_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add10_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add10_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add10_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add10_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add11_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add11_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add11_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add11_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_a0 : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_s1 : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_6_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_s1 : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add0_0_a : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add0_0_b : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add0_0_o : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add0_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add0_1_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_1_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_1_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_1_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_2_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_2_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_2_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_2_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_3_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_3_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_3_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_3_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_4_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_4_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_4_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_4_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_5_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add0_5_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add0_5_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add0_5_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add1_0_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add1_0_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add1_0_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add1_0_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add1_1_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add1_1_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add1_1_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add1_1_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add1_2_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add1_2_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add1_2_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add1_2_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add2_0_a : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add2_0_b : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add2_0_o : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add2_0_q : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add3_0_a : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_mtree_add3_0_b : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_mtree_add3_0_o : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_mtree_add3_0_q : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo1_cm7_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo1_cm8_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo1_cm9_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo1_cm10_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_cm12_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo1_cm14_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo1_cm20_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo1_mtree_mult1_15_a0 : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo1_mtree_mult1_15_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_15_s1 : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_mult1_15_reset : std_logic;
    signal u0_m0_wo1_mtree_mult1_15_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_mult1_14_a0 : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo1_mtree_mult1_14_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_14_s1 : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_mult1_14_reset : std_logic;
    signal u0_m0_wo1_mtree_mult1_14_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_mult1_13_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo1_mtree_mult1_13_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_13_s1 : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_mult1_13_reset : std_logic;
    signal u0_m0_wo1_mtree_mult1_13_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_mult1_12_a0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_mtree_mult1_12_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_12_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_mult1_12_reset : std_logic;
    signal u0_m0_wo1_mtree_mult1_12_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_s1 : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_reset : std_logic;
    signal u0_m0_wo1_mtree_mult1_10_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_mult1_8_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo1_mtree_mult1_8_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_8_s1 : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_mult1_8_reset : std_logic;
    signal u0_m0_wo1_mtree_mult1_8_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_a0 : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_s1 : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_reset : std_logic;
    signal u0_m0_wo1_mtree_mult1_2_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_add0_0_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_add0_0_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_add0_0_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_add0_0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_add0_1_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add0_1_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add0_1_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add0_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add0_2_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add0_2_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add0_2_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add0_2_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add0_3_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add0_3_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add0_3_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add0_3_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add0_4_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add0_4_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add0_4_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add0_4_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add0_5_a : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo1_mtree_add0_5_b : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo1_mtree_add0_5_o : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo1_mtree_add0_5_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo1_mtree_add0_6_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add0_6_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add0_6_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add0_6_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add0_7_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add0_7_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add0_7_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add0_7_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add0_8_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add0_8_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add0_8_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add0_8_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add0_9_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add0_9_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add0_9_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add0_9_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add0_10_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_add0_10_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_add0_10_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_add0_10_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_add1_0_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add1_0_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add1_0_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add1_0_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add1_1_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add1_1_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add1_1_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add1_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add1_2_a : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_mtree_add1_2_b : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_mtree_add1_2_o : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_mtree_add1_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_mtree_add1_3_a : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo1_mtree_add1_3_b : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo1_mtree_add1_3_o : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo1_mtree_add1_3_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo1_mtree_add1_4_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add1_4_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add1_4_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add1_4_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add1_5_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add1_5_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add1_5_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add1_5_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add2_0_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add2_0_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add2_0_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add2_0_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add2_1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo1_mtree_add2_1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo1_mtree_add2_1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo1_mtree_add2_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo1_mtree_add2_2_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add2_2_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add2_2_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add2_2_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add3_0_a : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo1_mtree_add3_0_b : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo1_mtree_add3_0_o : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo1_mtree_add3_0_q : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo1_mtree_add4_0_a : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo1_mtree_add4_0_b : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo1_mtree_add4_0_o : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo1_mtree_add4_0_q : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo2_mtree_mult1_20_a0 : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo2_mtree_mult1_20_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_20_s1 : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_20_reset : std_logic;
    signal u0_m0_wo2_mtree_mult1_20_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_14_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo2_mtree_mult1_14_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_14_s1 : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_mult1_14_reset : std_logic;
    signal u0_m0_wo2_mtree_mult1_14_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_mult1_12_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo2_mtree_mult1_12_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_12_s1 : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_mult1_12_reset : std_logic;
    signal u0_m0_wo2_mtree_mult1_12_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_a0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_reset : std_logic;
    signal u0_m0_wo2_mtree_mult1_10_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_mult1_9_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo2_mtree_mult1_9_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_9_s1 : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_mult1_9_reset : std_logic;
    signal u0_m0_wo2_mtree_mult1_9_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_a0 : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_s1 : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_reset : std_logic;
    signal u0_m0_wo2_mtree_mult1_8_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_mult1_7_a0 : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo2_mtree_mult1_7_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_7_s1 : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_mult1_7_reset : std_logic;
    signal u0_m0_wo2_mtree_mult1_7_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add0_0_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_0_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_0_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_1_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add0_1_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add0_1_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add0_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add0_2_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add0_2_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add0_2_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add0_2_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add0_3_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add0_3_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add0_3_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add0_3_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add0_4_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add0_4_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add0_4_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add0_4_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add0_5_a : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo2_mtree_add0_5_b : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo2_mtree_add0_5_o : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo2_mtree_add0_5_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo2_mtree_add0_6_a : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo2_mtree_add0_6_b : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo2_mtree_add0_6_o : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo2_mtree_add0_6_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo2_mtree_add0_7_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add0_7_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add0_7_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add0_7_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add0_8_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add0_8_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add0_8_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add0_8_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add0_9_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add0_9_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add0_9_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add0_9_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add0_10_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add0_10_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add0_10_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add0_10_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add1_0_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add1_0_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add1_0_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add1_0_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add1_1_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add1_1_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add1_1_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add1_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add1_2_a : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo2_mtree_add1_2_b : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo2_mtree_add1_2_o : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo2_mtree_add1_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo2_mtree_add1_3_a : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo2_mtree_add1_3_b : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo2_mtree_add1_3_o : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo2_mtree_add1_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo2_mtree_add1_4_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add1_4_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add1_4_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add1_4_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add1_5_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add1_5_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add1_5_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add1_5_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add2_0_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_add2_0_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_add2_0_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_add2_0_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_add2_1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo2_mtree_add2_1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo2_mtree_add2_1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo2_mtree_add2_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo2_mtree_add2_2_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_add2_2_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_add2_2_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_add2_2_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_add3_0_a : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo2_mtree_add3_0_b : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo2_mtree_add3_0_o : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo2_mtree_add3_0_q : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo2_mtree_add4_0_a : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo2_mtree_add4_0_b : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo2_mtree_add4_0_o : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo2_mtree_add4_0_q : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_3_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_3_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_3_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_3_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_3_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_3_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_3_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_3_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_sub_1_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_sub_1_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_sub_1_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_sub_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_sub_3_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_sub_3_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_sub_3_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_sub_3_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_add_5_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_add_5_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_add_5_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_add_5_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_sub_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_sub_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_sub_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_sub_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_sub_3_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_sub_3_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_sub_3_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_sub_3_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_add_5_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_add_5_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_add_5_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_add_5_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_sub_1_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_sub_1_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_sub_1_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_sub_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_3_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_3_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_3_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_3_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_3_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_3_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_3_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_3_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_5_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_5_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_5_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_5_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_5_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_5_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_5_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_5_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_3_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_3_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_3_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_3_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_5_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_5_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_5_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_5_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_3_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_3_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_3_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_3_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_5_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_5_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_5_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_5_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_mult1_22_sub_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_22_sub_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_22_sub_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_22_sub_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_22_sub_3_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_22_sub_3_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_22_sub_3_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_22_sub_3_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_21_sub_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_21_sub_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_21_sub_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_21_sub_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_sub_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_sub_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_sub_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_sub_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_sub_3_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_sub_3_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_sub_3_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_sub_3_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_add_5_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_add_5_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_add_5_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_add_5_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_19_sub_1_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_19_sub_1_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_19_sub_1_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_19_sub_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_18_add_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_18_add_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_18_add_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_18_add_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_18_add_3_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_18_add_3_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_18_add_3_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_18_add_3_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_17_add_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_17_add_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_17_add_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_17_add_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_17_add_3_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_17_add_3_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_17_add_3_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_17_add_3_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_17_sub_5_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_mult1_17_sub_5_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_mult1_17_sub_5_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_mult1_17_sub_5_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_mult1_16_add_1_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_16_add_1_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_16_add_1_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_16_add_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_16_add_3_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_16_add_3_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_16_add_3_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_16_add_3_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_sub_1_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_sub_1_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_sub_1_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_sub_1_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_sub_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_sub_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_sub_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_sub_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_3_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_3_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_3_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_3_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_sub_5_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_sub_5_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_sub_5_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_sub_5_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_add_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_add_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_add_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_add_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_add_3_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_add_3_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_add_3_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_add_3_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_sub_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_sub_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_sub_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_sub_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_add_3_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_add_3_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_add_3_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_add_3_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_add_5_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_add_5_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_add_5_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_add_5_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_add_1_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_add_1_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_add_1_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_add_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_sub_3_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_sub_3_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_sub_3_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_sub_3_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_sub_1_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_sub_1_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_sub_1_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_sub_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_sub_3_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_sub_3_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_sub_3_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_sub_3_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_sub_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_sub_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_sub_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_sub_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_sub_3_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_sub_3_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_sub_3_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_sub_3_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_add_5_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_add_5_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_add_5_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_add_5_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_add_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_add_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_add_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_add_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_sub_0_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_sub_0_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_sub_0_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_sub_0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_sub_2_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_sub_2_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_sub_2_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_sub_2_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_22_sub_0_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_22_sub_0_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_22_sub_0_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_22_sub_0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_22_sub_2_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_22_sub_2_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_22_sub_2_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_22_sub_2_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_21_add_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_21_add_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_21_add_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_21_add_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_sub_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_sub_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_sub_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_sub_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_sub_3_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_sub_3_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_sub_3_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_sub_3_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_add_5_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_add_5_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_add_5_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_add_5_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_sub_1_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_sub_1_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_sub_1_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_sub_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_sub_3_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_sub_3_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_sub_3_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_sub_3_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_17_add_1_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_17_add_1_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_17_add_1_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_17_add_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_17_sub_3_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_17_sub_3_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_17_sub_3_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_17_sub_3_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_sub_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_sub_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_sub_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_sub_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_add_3_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_add_3_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_add_3_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_add_3_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_add_5_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_add_5_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_add_5_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_add_5_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_add_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_add_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_add_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_add_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_add_3_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_add_3_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_add_3_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_add_3_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_sub_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_sub_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_sub_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_sub_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_add_3_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_add_3_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_add_3_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_add_3_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_sub_5_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_sub_5_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_sub_5_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_sub_5_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_11_sub_1_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_mult1_11_sub_1_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_mult1_11_sub_1_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_mult1_11_sub_1_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_add_1_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_add_1_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_add_1_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_add_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_add_3_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_add_3_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_add_3_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_add_3_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_add_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_add_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_add_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_add_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_add_3_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_add_3_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_add_3_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_add_3_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_sub_5_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_sub_5_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_sub_5_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_sub_5_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_add_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_add_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_add_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_add_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_add_3_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_add_3_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_add_3_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_add_3_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_sub_1_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_sub_1_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_sub_1_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_sub_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_sub_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_sub_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_sub_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_sub_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_sub_3_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_sub_3_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_sub_3_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_sub_3_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_add_5_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_add_5_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_add_5_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_add_5_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_sub_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_sub_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_sub_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_sub_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_sub_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_sub_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_sub_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_sub_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_sub_3_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_sub_3_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_sub_3_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_sub_3_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_22_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_22_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_22_shift2_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_22_shift2_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_22_shift1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_22_shift1_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_21_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_21_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_21_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_21_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_shift2_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_shift2_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_shift2_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_shift2_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_19_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_19_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_18_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_18_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_18_shift2_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_18_shift2_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_shift2_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_shift2_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_17_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_17_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_17_shift2_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_17_shift2_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_17_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_17_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_17_shift2_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_17_shift2_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_16_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_16_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_shift2_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_shift2_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_16_shift2_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_16_shift2_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_shift2_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_shift2_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_shift2_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_shift2_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_shift0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_shift0_qint : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_mult1_11_shift0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_mult1_11_shift0_qint : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_shift2_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_shift2_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_shift2_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_shift2_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_shift2_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_shift2_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_shift2_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_shift2_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_shift2_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_shift2_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_shift2_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_shift2_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_shift2_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_shift2_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_shift2_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_shift2_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_shift2_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_shift2_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_shift2_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_shift2_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_shift1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_shift1_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_shift2_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_shift2_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift2_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift2_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_shift2_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_shift2_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_shift2_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_shift2_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_shift2_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_shift2_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift2_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift2_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift2_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift2_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift2_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift2_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift2_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift2_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_shift4_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_shift4_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_shift4_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_shift4_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_shift4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_shift4_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_shift6_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_shift6_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift4_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift4_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift4_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift4_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift6_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift6_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift4_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift4_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift4_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift4_qint : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_mult1_21_shift2_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_21_shift2_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_shift6_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_20_shift6_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_19_shift2_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_19_shift2_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_18_shift4_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_18_shift4_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_17_shift4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_17_shift4_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_16_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_16_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_shift4_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_shift4_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_shift4_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_shift4_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_shift6_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_shift6_qint : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_shift6_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_shift6_qint : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_shift2_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_shift2_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_21_shift2_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_21_shift2_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_shift6_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_shift6_qint : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_shift4_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_shift4_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_shift6_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_shift6_qint : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_shift4_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_shift4_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_shift4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_shift4_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_shift4_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_shift4_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_shift2_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_shift2_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_shift6_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_shift6_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_shift2_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_shift2_qint : STD_LOGIC_VECTOR (21 downto 0);

begin


    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- d_u0_m0_wo0_wi0_r0_phasedelay0_q_11(DELAY,1009)@10 + 1
    d_u0_m0_wo0_wi0_r0_phasedelay0_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => d_u0_m0_wo0_wi0_r0_phasedelay0_q_11_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_phasedelay0_q_12(DELAY,1010)@11 + 1
    d_u0_m0_wo0_wi0_r0_phasedelay0_q_12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_phasedelay0_q_11_q, xout => d_u0_m0_wo0_wi0_r0_phasedelay0_q_12_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_phasedelay0_q_13(DELAY,1011)@12 + 1
    d_u0_m0_wo0_wi0_r0_phasedelay0_q_13 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_phasedelay0_q_12_q, xout => d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_22_shift1(BITSHIFT,540)@13
    u0_m0_wo2_mtree_mult1_22_shift1_qint <= d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q & "00000";
    u0_m0_wo2_mtree_mult1_22_shift1_q <= u0_m0_wo2_mtree_mult1_22_shift1_qint(20 downto 0);

    -- u0_m0_wo2_mtree_mult1_22_sub_0(SUB,539)@12 + 1
    u0_m0_wo2_mtree_mult1_22_sub_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 1 => GND_q(0)) & GND_q));
    u0_m0_wo2_mtree_mult1_22_sub_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => d_u0_m0_wo0_wi0_r0_phasedelay0_q_12_q(15)) & d_u0_m0_wo0_wi0_r0_phasedelay0_q_12_q));
    u0_m0_wo2_mtree_mult1_22_sub_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_22_sub_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_22_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_22_sub_0_a) - SIGNED(u0_m0_wo2_mtree_mult1_22_sub_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_22_sub_0_q <= u0_m0_wo2_mtree_mult1_22_sub_0_o(16 downto 0);

    -- u0_m0_wo2_mtree_mult1_22_sub_2(SUB,541)@13 + 1
    u0_m0_wo2_mtree_mult1_22_sub_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 17 => u0_m0_wo2_mtree_mult1_22_sub_0_q(16)) & u0_m0_wo2_mtree_mult1_22_sub_0_q));
    u0_m0_wo2_mtree_mult1_22_sub_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo2_mtree_mult1_22_shift1_q(20)) & u0_m0_wo2_mtree_mult1_22_shift1_q));
    u0_m0_wo2_mtree_mult1_22_sub_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_22_sub_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_22_sub_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_22_sub_2_a) - SIGNED(u0_m0_wo2_mtree_mult1_22_sub_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_22_sub_2_q <= u0_m0_wo2_mtree_mult1_22_sub_2_o(21 downto 0);

    -- u0_m0_wo2_mtree_mult1_21_shift0(BITSHIFT,542)@12
    u0_m0_wo2_mtree_mult1_21_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr1_q_12_q & "00";
    u0_m0_wo2_mtree_mult1_21_shift0_q <= u0_m0_wo2_mtree_mult1_21_shift0_qint(17 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr1(DELAY,20)@10
    u0_m0_wo0_wi0_r0_delayr1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => u0_m0_wo0_wi0_r0_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr1_q_11(DELAY,1012)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr1_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => d_u0_m0_wo0_wi0_r0_delayr1_q_11_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr1_q_12(DELAY,1013)@11 + 1
    d_u0_m0_wo0_wi0_r0_delayr1_q_12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr1_q_11_q, xout => d_u0_m0_wo0_wi0_r0_delayr1_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_21_add_1(ADD,543)@12 + 1
    u0_m0_wo2_mtree_mult1_21_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => d_u0_m0_wo0_wi0_r0_delayr1_q_12_q(15)) & d_u0_m0_wo0_wi0_r0_delayr1_q_12_q));
    u0_m0_wo2_mtree_mult1_21_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo2_mtree_mult1_21_shift0_q(17)) & u0_m0_wo2_mtree_mult1_21_shift0_q));
    u0_m0_wo2_mtree_mult1_21_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_21_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_21_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_21_add_1_a) + SIGNED(u0_m0_wo2_mtree_mult1_21_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_21_add_1_q <= u0_m0_wo2_mtree_mult1_21_add_1_o(18 downto 0);

    -- u0_m0_wo2_mtree_mult1_21_shift2(BITSHIFT,544)@13
    u0_m0_wo2_mtree_mult1_21_shift2_qint <= u0_m0_wo2_mtree_mult1_21_add_1_q & "00";
    u0_m0_wo2_mtree_mult1_21_shift2_q <= u0_m0_wo2_mtree_mult1_21_shift2_qint(20 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr2(DELAY,21)@10
    u0_m0_wo0_wi0_r0_delayr2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => u0_m0_wo0_wi0_r0_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr2_q_11(DELAY,1014)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr2_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr2_q, xout => d_u0_m0_wo0_wi0_r0_delayr2_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_cm20(CONSTANT,151)@0
    u0_m0_wo1_cm20_q <= "0101011010";

    -- u0_m0_wo2_mtree_mult1_20(MULT,262)@11 + 2
    u0_m0_wo2_mtree_mult1_20_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm20_q);
    u0_m0_wo2_mtree_mult1_20_b0 <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_delayr2_q_11_q);
    u0_m0_wo2_mtree_mult1_20_reset <= areset;
    u0_m0_wo2_mtree_mult1_20_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 10,
        lpm_widthb => 16,
        lpm_widthp => 26,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo2_mtree_mult1_20_a0,
        datab => u0_m0_wo2_mtree_mult1_20_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo2_mtree_mult1_20_reset,
        clock => clk,
        result => u0_m0_wo2_mtree_mult1_20_s1
    );
    u0_m0_wo2_mtree_mult1_20_q <= u0_m0_wo2_mtree_mult1_20_s1;

    -- u0_m0_wo2_mtree_add0_10(ADD,293)@13 + 1
    u0_m0_wo2_mtree_add0_10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo2_mtree_mult1_20_q(25)) & u0_m0_wo2_mtree_mult1_20_q));
    u0_m0_wo2_mtree_add0_10_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 21 => u0_m0_wo2_mtree_mult1_21_shift2_q(20)) & u0_m0_wo2_mtree_mult1_21_shift2_q));
    u0_m0_wo2_mtree_add0_10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_10_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_10_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_10_a) + SIGNED(u0_m0_wo2_mtree_add0_10_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_10_q <= u0_m0_wo2_mtree_add0_10_o(26 downto 0);

    -- u0_m0_wo2_mtree_add1_5(ADD,299)@14 + 1
    u0_m0_wo2_mtree_add1_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo2_mtree_add0_10_q(26)) & u0_m0_wo2_mtree_add0_10_q));
    u0_m0_wo2_mtree_add1_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 22 => u0_m0_wo2_mtree_mult1_22_sub_2_q(21)) & u0_m0_wo2_mtree_mult1_22_sub_2_q));
    u0_m0_wo2_mtree_add1_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add1_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add1_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add1_5_a) + SIGNED(u0_m0_wo2_mtree_add1_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add1_5_q <= u0_m0_wo2_mtree_add1_5_o(27 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr3(DELAY,22)@10
    u0_m0_wo0_wi0_r0_delayr3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr2_q, xout => u0_m0_wo0_wi0_r0_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr3_q_11(DELAY,1015)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr3_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr3_q, xout => d_u0_m0_wo0_wi0_r0_delayr3_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_19_shift2(BITSHIFT,556)@11
    u0_m0_wo2_mtree_mult1_19_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr3_q_11_q & "000";
    u0_m0_wo2_mtree_mult1_19_shift2_q <= u0_m0_wo2_mtree_mult1_19_shift2_qint(18 downto 0);

    -- u0_m0_wo2_mtree_mult1_19_sub_3(SUB,557)@11 + 1
    u0_m0_wo2_mtree_mult1_19_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo2_mtree_mult1_19_shift2_q(18)) & u0_m0_wo2_mtree_mult1_19_shift2_q));
    u0_m0_wo2_mtree_mult1_19_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => d_u0_m0_wo0_wi0_r0_delayr3_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr3_q_11_q));
    u0_m0_wo2_mtree_mult1_19_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_19_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_19_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_19_sub_3_a) - SIGNED(u0_m0_wo2_mtree_mult1_19_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_19_sub_3_q <= u0_m0_wo2_mtree_mult1_19_sub_3_o(19 downto 0);

    -- u0_m0_wo2_mtree_mult1_19_shift4(BITSHIFT,558)@12
    u0_m0_wo2_mtree_mult1_19_shift4_qint <= u0_m0_wo2_mtree_mult1_19_sub_3_q & "0000";
    u0_m0_wo2_mtree_mult1_19_shift4_q <= u0_m0_wo2_mtree_mult1_19_shift4_qint(23 downto 0);

    -- u0_m0_wo2_mtree_mult1_19_shift0(BITSHIFT,554)@11
    u0_m0_wo2_mtree_mult1_19_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr3_q_11_q & "00";
    u0_m0_wo2_mtree_mult1_19_shift0_q <= u0_m0_wo2_mtree_mult1_19_shift0_qint(17 downto 0);

    -- u0_m0_wo2_mtree_mult1_19_sub_1(SUB,555)@11 + 1
    u0_m0_wo2_mtree_mult1_19_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo2_mtree_mult1_19_shift0_q(17)) & u0_m0_wo2_mtree_mult1_19_shift0_q));
    u0_m0_wo2_mtree_mult1_19_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => d_u0_m0_wo0_wi0_r0_delayr3_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr3_q_11_q));
    u0_m0_wo2_mtree_mult1_19_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_19_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_19_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_19_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_19_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_19_sub_1_q <= u0_m0_wo2_mtree_mult1_19_sub_1_o(18 downto 0);

    -- u0_m0_wo2_mtree_mult1_19_add_5(ADD,559)@12 + 1
    u0_m0_wo2_mtree_mult1_19_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 19 => u0_m0_wo2_mtree_mult1_19_sub_1_q(18)) & u0_m0_wo2_mtree_mult1_19_sub_1_q));
    u0_m0_wo2_mtree_mult1_19_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo2_mtree_mult1_19_shift4_q(23)) & u0_m0_wo2_mtree_mult1_19_shift4_q));
    u0_m0_wo2_mtree_mult1_19_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_19_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_19_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_19_add_5_a) + SIGNED(u0_m0_wo2_mtree_mult1_19_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_19_add_5_q <= u0_m0_wo2_mtree_mult1_19_add_5_o(24 downto 0);

    -- u0_m0_wo2_mtree_mult1_19_shift6(BITSHIFT,560)@13
    u0_m0_wo2_mtree_mult1_19_shift6_qint <= u0_m0_wo2_mtree_mult1_19_add_5_q & "00";
    u0_m0_wo2_mtree_mult1_19_shift6_q <= u0_m0_wo2_mtree_mult1_19_shift6_qint(26 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr4(DELAY,23)@10
    u0_m0_wo0_wi0_r0_delayr4 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr3_q, xout => u0_m0_wo0_wi0_r0_delayr4_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr4_q_11(DELAY,1017)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr4_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr4_q, xout => d_u0_m0_wo0_wi0_r0_delayr4_q_11_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr4_q_12(DELAY,1018)@11 + 1
    d_u0_m0_wo0_wi0_r0_delayr4_q_12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr4_q_11_q, xout => d_u0_m0_wo0_wi0_r0_delayr4_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_18_shift2(BITSHIFT,563)@12
    u0_m0_wo2_mtree_mult1_18_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr4_q_12_q & "00000000";
    u0_m0_wo2_mtree_mult1_18_shift2_q <= u0_m0_wo2_mtree_mult1_18_shift2_qint(23 downto 0);

    -- u0_m0_wo2_mtree_mult1_18_shift0(BITSHIFT,561)@11
    u0_m0_wo2_mtree_mult1_18_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr4_q_11_q & "000000";
    u0_m0_wo2_mtree_mult1_18_shift0_q <= u0_m0_wo2_mtree_mult1_18_shift0_qint(21 downto 0);

    -- u0_m0_wo2_mtree_mult1_18_sub_1(SUB,562)@11 + 1
    u0_m0_wo2_mtree_mult1_18_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo2_mtree_mult1_18_shift0_q(21)) & u0_m0_wo2_mtree_mult1_18_shift0_q));
    u0_m0_wo2_mtree_mult1_18_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 16 => d_u0_m0_wo0_wi0_r0_delayr4_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr4_q_11_q));
    u0_m0_wo2_mtree_mult1_18_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_18_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_18_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_18_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_18_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_18_sub_1_q <= u0_m0_wo2_mtree_mult1_18_sub_1_o(22 downto 0);

    -- u0_m0_wo2_mtree_mult1_18_sub_3(SUB,564)@12 + 1
    u0_m0_wo2_mtree_mult1_18_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => u0_m0_wo2_mtree_mult1_18_sub_1_q(22)) & u0_m0_wo2_mtree_mult1_18_sub_1_q));
    u0_m0_wo2_mtree_mult1_18_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo2_mtree_mult1_18_shift2_q(23)) & u0_m0_wo2_mtree_mult1_18_shift2_q));
    u0_m0_wo2_mtree_mult1_18_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_18_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_18_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_18_sub_3_a) - SIGNED(u0_m0_wo2_mtree_mult1_18_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_18_sub_3_q <= u0_m0_wo2_mtree_mult1_18_sub_3_o(24 downto 0);

    -- u0_m0_wo2_mtree_add0_9(ADD,292)@13 + 1
    u0_m0_wo2_mtree_add0_9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => u0_m0_wo2_mtree_mult1_18_sub_3_q(24)) & u0_m0_wo2_mtree_mult1_18_sub_3_q));
    u0_m0_wo2_mtree_add0_9_b <= STD_LOGIC_VECTOR(u0_m0_wo2_mtree_mult1_19_shift6_q);
    u0_m0_wo2_mtree_add0_9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_9_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_9_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_9_a) + SIGNED(u0_m0_wo2_mtree_add0_9_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_9_q <= u0_m0_wo2_mtree_add0_9_o(26 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr5(DELAY,24)@10
    u0_m0_wo0_wi0_r0_delayr5 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr4_q, xout => u0_m0_wo0_wi0_r0_delayr5_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr5_q_11(DELAY,1019)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr5_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr5_q, xout => d_u0_m0_wo0_wi0_r0_delayr5_q_11_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr5_q_12(DELAY,1020)@11 + 1
    d_u0_m0_wo0_wi0_r0_delayr5_q_12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr5_q_11_q, xout => d_u0_m0_wo0_wi0_r0_delayr5_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_17_shift2(BITSHIFT,567)@12
    u0_m0_wo2_mtree_mult1_17_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr5_q_12_q & "000000000";
    u0_m0_wo2_mtree_mult1_17_shift2_q <= u0_m0_wo2_mtree_mult1_17_shift2_qint(24 downto 0);

    -- u0_m0_wo2_mtree_mult1_17_shift0(BITSHIFT,565)@11
    u0_m0_wo2_mtree_mult1_17_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr5_q_11_q & "000000";
    u0_m0_wo2_mtree_mult1_17_shift0_q <= u0_m0_wo2_mtree_mult1_17_shift0_qint(21 downto 0);

    -- u0_m0_wo2_mtree_mult1_17_add_1(ADD,566)@11 + 1
    u0_m0_wo2_mtree_mult1_17_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 16 => d_u0_m0_wo0_wi0_r0_delayr5_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr5_q_11_q));
    u0_m0_wo2_mtree_mult1_17_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo2_mtree_mult1_17_shift0_q(21)) & u0_m0_wo2_mtree_mult1_17_shift0_q));
    u0_m0_wo2_mtree_mult1_17_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_17_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_17_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_17_add_1_a) + SIGNED(u0_m0_wo2_mtree_mult1_17_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_17_add_1_q <= u0_m0_wo2_mtree_mult1_17_add_1_o(22 downto 0);

    -- u0_m0_wo2_mtree_mult1_17_sub_3(SUB,568)@12 + 1
    u0_m0_wo2_mtree_mult1_17_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 23 => u0_m0_wo2_mtree_mult1_17_add_1_q(22)) & u0_m0_wo2_mtree_mult1_17_add_1_q));
    u0_m0_wo2_mtree_mult1_17_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo2_mtree_mult1_17_shift2_q(24)) & u0_m0_wo2_mtree_mult1_17_shift2_q));
    u0_m0_wo2_mtree_mult1_17_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_17_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_17_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_17_sub_3_a) - SIGNED(u0_m0_wo2_mtree_mult1_17_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_17_sub_3_q <= u0_m0_wo2_mtree_mult1_17_sub_3_o(25 downto 0);

    -- u0_m0_wo2_mtree_mult1_16_shift2(BITSHIFT,571)@11
    u0_m0_wo2_mtree_mult1_16_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr6_q_11_q & "000";
    u0_m0_wo2_mtree_mult1_16_shift2_q <= u0_m0_wo2_mtree_mult1_16_shift2_qint(18 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr6(DELAY,25)@10
    u0_m0_wo0_wi0_r0_delayr6 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr5_q, xout => u0_m0_wo0_wi0_r0_delayr6_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr6_q_11(DELAY,1021)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr6_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr6_q, xout => d_u0_m0_wo0_wi0_r0_delayr6_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_16_add_3(ADD,572)@11 + 1
    u0_m0_wo2_mtree_mult1_16_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => d_u0_m0_wo0_wi0_r0_delayr6_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr6_q_11_q));
    u0_m0_wo2_mtree_mult1_16_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo2_mtree_mult1_16_shift2_q(18)) & u0_m0_wo2_mtree_mult1_16_shift2_q));
    u0_m0_wo2_mtree_mult1_16_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_16_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_16_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_16_add_3_a) + SIGNED(u0_m0_wo2_mtree_mult1_16_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_16_add_3_q <= u0_m0_wo2_mtree_mult1_16_add_3_o(19 downto 0);

    -- u0_m0_wo2_mtree_mult1_16_shift4(BITSHIFT,573)@12
    u0_m0_wo2_mtree_mult1_16_shift4_qint <= u0_m0_wo2_mtree_mult1_16_add_3_q & "00000";
    u0_m0_wo2_mtree_mult1_16_shift4_q <= u0_m0_wo2_mtree_mult1_16_shift4_qint(24 downto 0);

    -- u0_m0_wo2_mtree_mult1_16_shift0(BITSHIFT,569)@11
    u0_m0_wo2_mtree_mult1_16_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr6_q_11_q & "000";
    u0_m0_wo2_mtree_mult1_16_shift0_q <= u0_m0_wo2_mtree_mult1_16_shift0_qint(18 downto 0);

    -- u0_m0_wo2_mtree_mult1_16_sub_1(SUB,570)@11 + 1
    u0_m0_wo2_mtree_mult1_16_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo2_mtree_mult1_16_shift0_q(18)) & u0_m0_wo2_mtree_mult1_16_shift0_q));
    u0_m0_wo2_mtree_mult1_16_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => d_u0_m0_wo0_wi0_r0_delayr6_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr6_q_11_q));
    u0_m0_wo2_mtree_mult1_16_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_16_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_16_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_16_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_16_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_16_sub_1_q <= u0_m0_wo2_mtree_mult1_16_sub_1_o(19 downto 0);

    -- u0_m0_wo2_mtree_mult1_16_add_5(ADD,574)@12 + 1
    u0_m0_wo2_mtree_mult1_16_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 20 => u0_m0_wo2_mtree_mult1_16_sub_1_q(19)) & u0_m0_wo2_mtree_mult1_16_sub_1_q));
    u0_m0_wo2_mtree_mult1_16_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo2_mtree_mult1_16_shift4_q(24)) & u0_m0_wo2_mtree_mult1_16_shift4_q));
    u0_m0_wo2_mtree_mult1_16_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_16_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_16_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_16_add_5_a) + SIGNED(u0_m0_wo2_mtree_mult1_16_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_16_add_5_q <= u0_m0_wo2_mtree_mult1_16_add_5_o(25 downto 0);

    -- u0_m0_wo2_mtree_mult1_16_shift6(BITSHIFT,575)@13
    u0_m0_wo2_mtree_mult1_16_shift6_qint <= u0_m0_wo2_mtree_mult1_16_add_5_q & "0";
    u0_m0_wo2_mtree_mult1_16_shift6_q <= u0_m0_wo2_mtree_mult1_16_shift6_qint(26 downto 0);

    -- u0_m0_wo2_mtree_add0_8(ADD,291)@13 + 1
    u0_m0_wo2_mtree_add0_8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo2_mtree_mult1_16_shift6_q(26)) & u0_m0_wo2_mtree_mult1_16_shift6_q));
    u0_m0_wo2_mtree_add0_8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 26 => u0_m0_wo2_mtree_mult1_17_sub_3_q(25)) & u0_m0_wo2_mtree_mult1_17_sub_3_q));
    u0_m0_wo2_mtree_add0_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_8_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_8_a) + SIGNED(u0_m0_wo2_mtree_add0_8_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_8_q <= u0_m0_wo2_mtree_add0_8_o(27 downto 0);

    -- u0_m0_wo2_mtree_add1_4(ADD,298)@14 + 1
    u0_m0_wo2_mtree_add1_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo2_mtree_add0_8_q(27)) & u0_m0_wo2_mtree_add0_8_q));
    u0_m0_wo2_mtree_add1_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 27 => u0_m0_wo2_mtree_add0_9_q(26)) & u0_m0_wo2_mtree_add0_9_q));
    u0_m0_wo2_mtree_add1_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add1_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add1_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add1_4_a) + SIGNED(u0_m0_wo2_mtree_add1_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add1_4_q <= u0_m0_wo2_mtree_add1_4_o(28 downto 0);

    -- u0_m0_wo2_mtree_add2_2(ADD,302)@15 + 1
    u0_m0_wo2_mtree_add2_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo2_mtree_add1_4_q(28)) & u0_m0_wo2_mtree_add1_4_q));
    u0_m0_wo2_mtree_add2_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 28 => u0_m0_wo2_mtree_add1_5_q(27)) & u0_m0_wo2_mtree_add1_5_q));
    u0_m0_wo2_mtree_add2_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add2_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add2_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add2_2_a) + SIGNED(u0_m0_wo2_mtree_add2_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add2_2_q <= u0_m0_wo2_mtree_add2_2_o(29 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr7(DELAY,26)@10
    u0_m0_wo0_wi0_r0_delayr7 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr6_q, xout => u0_m0_wo0_wi0_r0_delayr7_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr7_q_11(DELAY,1023)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr7_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr7_q, xout => d_u0_m0_wo0_wi0_r0_delayr7_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_15_shift2(BITSHIFT,578)@11
    u0_m0_wo2_mtree_mult1_15_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr7_q_11_q & "000000000";
    u0_m0_wo2_mtree_mult1_15_shift2_q <= u0_m0_wo2_mtree_mult1_15_shift2_qint(24 downto 0);

    -- u0_m0_wo2_mtree_mult1_15_shift0(BITSHIFT,576)@10
    u0_m0_wo2_mtree_mult1_15_shift0_qint <= u0_m0_wo0_wi0_r0_delayr7_q & "0";
    u0_m0_wo2_mtree_mult1_15_shift0_q <= u0_m0_wo2_mtree_mult1_15_shift0_qint(16 downto 0);

    -- u0_m0_wo2_mtree_mult1_15_add_1(ADD,577)@10 + 1
    u0_m0_wo2_mtree_mult1_15_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => u0_m0_wo0_wi0_r0_delayr7_q(15)) & u0_m0_wo0_wi0_r0_delayr7_q));
    u0_m0_wo2_mtree_mult1_15_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo2_mtree_mult1_15_shift0_q(16)) & u0_m0_wo2_mtree_mult1_15_shift0_q));
    u0_m0_wo2_mtree_mult1_15_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_15_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_15_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_15_add_1_a) + SIGNED(u0_m0_wo2_mtree_mult1_15_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_15_add_1_q <= u0_m0_wo2_mtree_mult1_15_add_1_o(17 downto 0);

    -- u0_m0_wo2_mtree_mult1_15_add_3(ADD,579)@11 + 1
    u0_m0_wo2_mtree_mult1_15_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 18 => u0_m0_wo2_mtree_mult1_15_add_1_q(17)) & u0_m0_wo2_mtree_mult1_15_add_1_q));
    u0_m0_wo2_mtree_mult1_15_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo2_mtree_mult1_15_shift2_q(24)) & u0_m0_wo2_mtree_mult1_15_shift2_q));
    u0_m0_wo2_mtree_mult1_15_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_15_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_15_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_15_add_3_a) + SIGNED(u0_m0_wo2_mtree_mult1_15_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_15_add_3_q <= u0_m0_wo2_mtree_mult1_15_add_3_o(25 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr8(DELAY,27)@10
    u0_m0_wo0_wi0_r0_delayr8 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr7_q, xout => u0_m0_wo0_wi0_r0_delayr8_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo1_cm14(CONSTANT,145)@0
    u0_m0_wo1_cm14_q <= "101001010101";

    -- u0_m0_wo2_mtree_mult1_14(MULT,268)@10 + 2
    u0_m0_wo2_mtree_mult1_14_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm14_q);
    u0_m0_wo2_mtree_mult1_14_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr8_q);
    u0_m0_wo2_mtree_mult1_14_reset <= areset;
    u0_m0_wo2_mtree_mult1_14_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 16,
        lpm_widthp => 28,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo2_mtree_mult1_14_a0,
        datab => u0_m0_wo2_mtree_mult1_14_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo2_mtree_mult1_14_reset,
        clock => clk,
        result => u0_m0_wo2_mtree_mult1_14_s1
    );
    u0_m0_wo2_mtree_mult1_14_q <= u0_m0_wo2_mtree_mult1_14_s1;

    -- u0_m0_wo2_mtree_add0_7(ADD,290)@12 + 1
    u0_m0_wo2_mtree_add0_7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo2_mtree_mult1_14_q(27)) & u0_m0_wo2_mtree_mult1_14_q));
    u0_m0_wo2_mtree_add0_7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 26 => u0_m0_wo2_mtree_mult1_15_add_3_q(25)) & u0_m0_wo2_mtree_mult1_15_add_3_q));
    u0_m0_wo2_mtree_add0_7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_7_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_7_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_7_a) + SIGNED(u0_m0_wo2_mtree_add0_7_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_7_q <= u0_m0_wo2_mtree_add0_7_o(28 downto 0);

    -- u0_m0_wo2_mtree_mult1_13_shift2(BITSHIFT,592)@10
    u0_m0_wo2_mtree_mult1_13_shift2_qint <= u0_m0_wo0_wi0_r0_delayr9_q & "0000";
    u0_m0_wo2_mtree_mult1_13_shift2_q <= u0_m0_wo2_mtree_mult1_13_shift2_qint(19 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr9(DELAY,28)@10
    u0_m0_wo0_wi0_r0_delayr9 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr8_q, xout => u0_m0_wo0_wi0_r0_delayr9_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_13_add_3(ADD,593)@10 + 1
    u0_m0_wo2_mtree_mult1_13_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 16 => u0_m0_wo0_wi0_r0_delayr9_q(15)) & u0_m0_wo0_wi0_r0_delayr9_q));
    u0_m0_wo2_mtree_mult1_13_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo2_mtree_mult1_13_shift2_q(19)) & u0_m0_wo2_mtree_mult1_13_shift2_q));
    u0_m0_wo2_mtree_mult1_13_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_13_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_13_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_13_add_3_a) + SIGNED(u0_m0_wo2_mtree_mult1_13_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_13_add_3_q <= u0_m0_wo2_mtree_mult1_13_add_3_o(20 downto 0);

    -- u0_m0_wo2_mtree_mult1_13_shift4(BITSHIFT,594)@11
    u0_m0_wo2_mtree_mult1_13_shift4_qint <= u0_m0_wo2_mtree_mult1_13_add_3_q & "0000";
    u0_m0_wo2_mtree_mult1_13_shift4_q <= u0_m0_wo2_mtree_mult1_13_shift4_qint(24 downto 0);

    -- u0_m0_wo2_mtree_mult1_13_shift0(BITSHIFT,590)@10
    u0_m0_wo2_mtree_mult1_13_shift0_qint <= u0_m0_wo0_wi0_r0_delayr9_q & "00";
    u0_m0_wo2_mtree_mult1_13_shift0_q <= u0_m0_wo2_mtree_mult1_13_shift0_qint(17 downto 0);

    -- u0_m0_wo2_mtree_mult1_13_sub_1(SUB,591)@10 + 1
    u0_m0_wo2_mtree_mult1_13_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 1 => GND_q(0)) & GND_q));
    u0_m0_wo2_mtree_mult1_13_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo2_mtree_mult1_13_shift0_q(17)) & u0_m0_wo2_mtree_mult1_13_shift0_q));
    u0_m0_wo2_mtree_mult1_13_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_13_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_13_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_13_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_13_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_13_sub_1_q <= u0_m0_wo2_mtree_mult1_13_sub_1_o(18 downto 0);

    -- u0_m0_wo2_mtree_mult1_13_sub_5(SUB,595)@11 + 1
    u0_m0_wo2_mtree_mult1_13_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 19 => u0_m0_wo2_mtree_mult1_13_sub_1_q(18)) & u0_m0_wo2_mtree_mult1_13_sub_1_q));
    u0_m0_wo2_mtree_mult1_13_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo2_mtree_mult1_13_shift4_q(24)) & u0_m0_wo2_mtree_mult1_13_shift4_q));
    u0_m0_wo2_mtree_mult1_13_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_13_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_13_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_13_sub_5_a) - SIGNED(u0_m0_wo2_mtree_mult1_13_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_13_sub_5_q <= u0_m0_wo2_mtree_mult1_13_sub_5_o(25 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr10(DELAY,29)@10
    u0_m0_wo0_wi0_r0_delayr10 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr9_q, xout => u0_m0_wo0_wi0_r0_delayr10_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo1_cm12(CONSTANT,143)@0
    u0_m0_wo1_cm12_q <= "01010110110101";

    -- u0_m0_wo2_mtree_mult1_12(MULT,270)@10 + 2
    u0_m0_wo2_mtree_mult1_12_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm12_q);
    u0_m0_wo2_mtree_mult1_12_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr10_q);
    u0_m0_wo2_mtree_mult1_12_reset <= areset;
    u0_m0_wo2_mtree_mult1_12_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 14,
        lpm_widthb => 16,
        lpm_widthp => 30,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo2_mtree_mult1_12_a0,
        datab => u0_m0_wo2_mtree_mult1_12_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo2_mtree_mult1_12_reset,
        clock => clk,
        result => u0_m0_wo2_mtree_mult1_12_s1
    );
    u0_m0_wo2_mtree_mult1_12_q <= u0_m0_wo2_mtree_mult1_12_s1;

    -- u0_m0_wo2_mtree_add0_6(ADD,289)@12 + 1
    u0_m0_wo2_mtree_add0_6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo2_mtree_mult1_12_q(29)) & u0_m0_wo2_mtree_mult1_12_q));
    u0_m0_wo2_mtree_add0_6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 26 => u0_m0_wo2_mtree_mult1_13_sub_5_q(25)) & u0_m0_wo2_mtree_mult1_13_sub_5_q));
    u0_m0_wo2_mtree_add0_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_6_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_6_a) + SIGNED(u0_m0_wo2_mtree_add0_6_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_6_q <= u0_m0_wo2_mtree_add0_6_o(30 downto 0);

    -- u0_m0_wo2_mtree_add1_3(ADD,297)@13 + 1
    u0_m0_wo2_mtree_add1_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo2_mtree_add0_6_q(30)) & u0_m0_wo2_mtree_add0_6_q));
    u0_m0_wo2_mtree_add1_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 29 => u0_m0_wo2_mtree_add0_7_q(28)) & u0_m0_wo2_mtree_add0_7_q));
    u0_m0_wo2_mtree_add1_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add1_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add1_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add1_3_a) + SIGNED(u0_m0_wo2_mtree_add1_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add1_3_q <= u0_m0_wo2_mtree_add1_3_o(31 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr11(DELAY,30)@10
    u0_m0_wo0_wi0_r0_delayr11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr10_q, xout => u0_m0_wo0_wi0_r0_delayr11_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr11_q_11(DELAY,1024)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr11_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr11_q, xout => d_u0_m0_wo0_wi0_r0_delayr11_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_11_shift0(BITSHIFT,608)@11
    u0_m0_wo2_mtree_mult1_11_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr11_q_11_q & "0000000000000";
    u0_m0_wo2_mtree_mult1_11_shift0_q <= u0_m0_wo2_mtree_mult1_11_shift0_qint(28 downto 0);

    -- u0_m0_wo2_mtree_mult1_11_sub_1(SUB,609)@11 + 1
    u0_m0_wo2_mtree_mult1_11_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo2_mtree_mult1_11_shift0_q(28)) & u0_m0_wo2_mtree_mult1_11_shift0_q));
    u0_m0_wo2_mtree_mult1_11_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 16 => d_u0_m0_wo0_wi0_r0_delayr11_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr11_q_11_q));
    u0_m0_wo2_mtree_mult1_11_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_11_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_11_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_11_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_11_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_11_sub_1_q <= u0_m0_wo2_mtree_mult1_11_sub_1_o(29 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr12(DELAY,31)@10
    u0_m0_wo0_wi0_r0_delayr12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr11_q, xout => u0_m0_wo0_wi0_r0_delayr12_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo1_cm10(CONSTANT,141)@0
    u0_m0_wo1_cm10_q <= "0110110010010";

    -- u0_m0_wo2_mtree_mult1_10(MULT,272)@10 + 2
    u0_m0_wo2_mtree_mult1_10_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm10_q);
    u0_m0_wo2_mtree_mult1_10_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr12_q);
    u0_m0_wo2_mtree_mult1_10_reset <= areset;
    u0_m0_wo2_mtree_mult1_10_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 13,
        lpm_widthb => 16,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo2_mtree_mult1_10_a0,
        datab => u0_m0_wo2_mtree_mult1_10_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo2_mtree_mult1_10_reset,
        clock => clk,
        result => u0_m0_wo2_mtree_mult1_10_s1
    );
    u0_m0_wo2_mtree_mult1_10_q <= u0_m0_wo2_mtree_mult1_10_s1;

    -- u0_m0_wo2_mtree_add0_5(ADD,288)@12 + 1
    u0_m0_wo2_mtree_add0_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => u0_m0_wo2_mtree_mult1_10_q(28)) & u0_m0_wo2_mtree_mult1_10_q));
    u0_m0_wo2_mtree_add0_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo2_mtree_mult1_11_sub_1_q(29)) & u0_m0_wo2_mtree_mult1_11_sub_1_q));
    u0_m0_wo2_mtree_add0_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_5_a) + SIGNED(u0_m0_wo2_mtree_add0_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_5_q <= u0_m0_wo2_mtree_add0_5_o(30 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr13(DELAY,32)@10
    u0_m0_wo0_wi0_r0_delayr13 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr12_q, xout => u0_m0_wo0_wi0_r0_delayr13_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo1_cm9(CONSTANT,140)@0
    u0_m0_wo1_cm9_q <= "101011001011";

    -- u0_m0_wo2_mtree_mult1_9(MULT,273)@10 + 2
    u0_m0_wo2_mtree_mult1_9_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm9_q);
    u0_m0_wo2_mtree_mult1_9_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr13_q);
    u0_m0_wo2_mtree_mult1_9_reset <= areset;
    u0_m0_wo2_mtree_mult1_9_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 16,
        lpm_widthp => 28,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo2_mtree_mult1_9_a0,
        datab => u0_m0_wo2_mtree_mult1_9_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo2_mtree_mult1_9_reset,
        clock => clk,
        result => u0_m0_wo2_mtree_mult1_9_s1
    );
    u0_m0_wo2_mtree_mult1_9_q <= u0_m0_wo2_mtree_mult1_9_s1;

    -- u0_m0_wo0_wi0_r0_delayr14(DELAY,33)@10
    u0_m0_wo0_wi0_r0_delayr14 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr13_q, xout => u0_m0_wo0_wi0_r0_delayr14_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo1_cm8(CONSTANT,139)@0
    u0_m0_wo1_cm8_q <= "10011000011";

    -- u0_m0_wo2_mtree_mult1_8(MULT,274)@10 + 2
    u0_m0_wo2_mtree_mult1_8_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm8_q);
    u0_m0_wo2_mtree_mult1_8_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr14_q);
    u0_m0_wo2_mtree_mult1_8_reset <= areset;
    u0_m0_wo2_mtree_mult1_8_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 11,
        lpm_widthb => 16,
        lpm_widthp => 27,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo2_mtree_mult1_8_a0,
        datab => u0_m0_wo2_mtree_mult1_8_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo2_mtree_mult1_8_reset,
        clock => clk,
        result => u0_m0_wo2_mtree_mult1_8_s1
    );
    u0_m0_wo2_mtree_mult1_8_q <= u0_m0_wo2_mtree_mult1_8_s1;

    -- u0_m0_wo2_mtree_add0_4(ADD,287)@12 + 1
    u0_m0_wo2_mtree_add0_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 27 => u0_m0_wo2_mtree_mult1_8_q(26)) & u0_m0_wo2_mtree_mult1_8_q));
    u0_m0_wo2_mtree_add0_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo2_mtree_mult1_9_q(27)) & u0_m0_wo2_mtree_mult1_9_q));
    u0_m0_wo2_mtree_add0_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_4_a) + SIGNED(u0_m0_wo2_mtree_add0_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_4_q <= u0_m0_wo2_mtree_add0_4_o(28 downto 0);

    -- u0_m0_wo2_mtree_add1_2(ADD,296)@13 + 1
    u0_m0_wo2_mtree_add1_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 29 => u0_m0_wo2_mtree_add0_4_q(28)) & u0_m0_wo2_mtree_add0_4_q));
    u0_m0_wo2_mtree_add1_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo2_mtree_add0_5_q(30)) & u0_m0_wo2_mtree_add0_5_q));
    u0_m0_wo2_mtree_add1_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add1_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add1_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add1_2_a) + SIGNED(u0_m0_wo2_mtree_add1_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add1_2_q <= u0_m0_wo2_mtree_add1_2_o(31 downto 0);

    -- u0_m0_wo2_mtree_add2_1(ADD,301)@14 + 1
    u0_m0_wo2_mtree_add2_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo2_mtree_add1_2_q(31)) & u0_m0_wo2_mtree_add1_2_q));
    u0_m0_wo2_mtree_add2_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo2_mtree_add1_3_q(31)) & u0_m0_wo2_mtree_add1_3_q));
    u0_m0_wo2_mtree_add2_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add2_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add2_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add2_1_a) + SIGNED(u0_m0_wo2_mtree_add2_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add2_1_q <= u0_m0_wo2_mtree_add2_1_o(32 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr15(DELAY,34)@10
    u0_m0_wo0_wi0_r0_delayr15 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr14_q, xout => u0_m0_wo0_wi0_r0_delayr15_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo1_cm7(CONSTANT,138)@0
    u0_m0_wo1_cm7_q <= "01101001011";

    -- u0_m0_wo2_mtree_mult1_7(MULT,275)@10 + 2
    u0_m0_wo2_mtree_mult1_7_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm7_q);
    u0_m0_wo2_mtree_mult1_7_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr15_q);
    u0_m0_wo2_mtree_mult1_7_reset <= areset;
    u0_m0_wo2_mtree_mult1_7_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 11,
        lpm_widthb => 16,
        lpm_widthp => 27,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo2_mtree_mult1_7_a0,
        datab => u0_m0_wo2_mtree_mult1_7_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo2_mtree_mult1_7_reset,
        clock => clk,
        result => u0_m0_wo2_mtree_mult1_7_s1
    );
    u0_m0_wo2_mtree_mult1_7_q <= u0_m0_wo2_mtree_mult1_7_s1;

    -- u0_m0_wo0_wi0_r0_delayr16(DELAY,35)@10
    u0_m0_wo0_wi0_r0_delayr16 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr15_q, xout => u0_m0_wo0_wi0_r0_delayr16_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr16_q_11(DELAY,1026)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr16_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr16_q, xout => d_u0_m0_wo0_wi0_r0_delayr16_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_6_shift2(BITSHIFT,649)@11
    u0_m0_wo2_mtree_mult1_6_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr16_q_11_q & "00000";
    u0_m0_wo2_mtree_mult1_6_shift2_q <= u0_m0_wo2_mtree_mult1_6_shift2_qint(20 downto 0);

    -- u0_m0_wo2_mtree_mult1_6_shift0(BITSHIFT,647)@10
    u0_m0_wo2_mtree_mult1_6_shift0_qint <= u0_m0_wo0_wi0_r0_delayr16_q & "0000";
    u0_m0_wo2_mtree_mult1_6_shift0_q <= u0_m0_wo2_mtree_mult1_6_shift0_qint(19 downto 0);

    -- u0_m0_wo2_mtree_mult1_6_add_1(ADD,648)@10 + 1
    u0_m0_wo2_mtree_mult1_6_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 16 => u0_m0_wo0_wi0_r0_delayr16_q(15)) & u0_m0_wo0_wi0_r0_delayr16_q));
    u0_m0_wo2_mtree_mult1_6_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo2_mtree_mult1_6_shift0_q(19)) & u0_m0_wo2_mtree_mult1_6_shift0_q));
    u0_m0_wo2_mtree_mult1_6_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_6_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_6_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_6_add_1_a) + SIGNED(u0_m0_wo2_mtree_mult1_6_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_6_add_1_q <= u0_m0_wo2_mtree_mult1_6_add_1_o(20 downto 0);

    -- u0_m0_wo2_mtree_mult1_6_add_3(ADD,650)@11 + 1
    u0_m0_wo2_mtree_mult1_6_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo2_mtree_mult1_6_add_1_q(20)) & u0_m0_wo2_mtree_mult1_6_add_1_q));
    u0_m0_wo2_mtree_mult1_6_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo2_mtree_mult1_6_shift2_q(20)) & u0_m0_wo2_mtree_mult1_6_shift2_q));
    u0_m0_wo2_mtree_mult1_6_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_6_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_6_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_6_add_3_a) + SIGNED(u0_m0_wo2_mtree_mult1_6_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_6_add_3_q <= u0_m0_wo2_mtree_mult1_6_add_3_o(21 downto 0);

    -- u0_m0_wo2_mtree_mult1_6_shift4(BITSHIFT,651)@12
    u0_m0_wo2_mtree_mult1_6_shift4_qint <= u0_m0_wo2_mtree_mult1_6_add_3_q & "00";
    u0_m0_wo2_mtree_mult1_6_shift4_q <= u0_m0_wo2_mtree_mult1_6_shift4_qint(23 downto 0);

    -- u0_m0_wo2_mtree_add0_3(ADD,286)@12 + 1
    u0_m0_wo2_mtree_add0_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 24 => u0_m0_wo2_mtree_mult1_6_shift4_q(23)) & u0_m0_wo2_mtree_mult1_6_shift4_q));
    u0_m0_wo2_mtree_add0_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo2_mtree_mult1_7_q(26)) & u0_m0_wo2_mtree_mult1_7_q));
    u0_m0_wo2_mtree_add0_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_3_a) + SIGNED(u0_m0_wo2_mtree_add0_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_3_q <= u0_m0_wo2_mtree_add0_3_o(27 downto 0);

    -- u0_m0_wo2_mtree_mult1_5_shift2(BITSHIFT,654)@10
    u0_m0_wo2_mtree_mult1_5_shift2_qint <= u0_m0_wo0_wi0_r0_delayr17_q & "00000";
    u0_m0_wo2_mtree_mult1_5_shift2_q <= u0_m0_wo2_mtree_mult1_5_shift2_qint(20 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr17(DELAY,36)@10
    u0_m0_wo0_wi0_r0_delayr17 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr16_q, xout => u0_m0_wo0_wi0_r0_delayr17_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_5_add_3(ADD,655)@10 + 1
    u0_m0_wo2_mtree_mult1_5_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 16 => u0_m0_wo0_wi0_r0_delayr17_q(15)) & u0_m0_wo0_wi0_r0_delayr17_q));
    u0_m0_wo2_mtree_mult1_5_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo2_mtree_mult1_5_shift2_q(20)) & u0_m0_wo2_mtree_mult1_5_shift2_q));
    u0_m0_wo2_mtree_mult1_5_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_5_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_5_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_5_add_3_a) + SIGNED(u0_m0_wo2_mtree_mult1_5_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_5_add_3_q <= u0_m0_wo2_mtree_mult1_5_add_3_o(21 downto 0);

    -- u0_m0_wo2_mtree_mult1_5_shift4(BITSHIFT,656)@11
    u0_m0_wo2_mtree_mult1_5_shift4_qint <= u0_m0_wo2_mtree_mult1_5_add_3_q & "0000";
    u0_m0_wo2_mtree_mult1_5_shift4_q <= u0_m0_wo2_mtree_mult1_5_shift4_qint(25 downto 0);

    -- u0_m0_wo2_mtree_mult1_5_shift0(BITSHIFT,652)@10
    u0_m0_wo2_mtree_mult1_5_shift0_qint <= u0_m0_wo0_wi0_r0_delayr17_q & "00";
    u0_m0_wo2_mtree_mult1_5_shift0_q <= u0_m0_wo2_mtree_mult1_5_shift0_qint(17 downto 0);

    -- u0_m0_wo2_mtree_mult1_5_add_1(ADD,653)@10 + 1
    u0_m0_wo2_mtree_mult1_5_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo0_wi0_r0_delayr17_q(15)) & u0_m0_wo0_wi0_r0_delayr17_q));
    u0_m0_wo2_mtree_mult1_5_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo2_mtree_mult1_5_shift0_q(17)) & u0_m0_wo2_mtree_mult1_5_shift0_q));
    u0_m0_wo2_mtree_mult1_5_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_5_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_5_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_5_add_1_a) + SIGNED(u0_m0_wo2_mtree_mult1_5_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_5_add_1_q <= u0_m0_wo2_mtree_mult1_5_add_1_o(18 downto 0);

    -- u0_m0_wo2_mtree_mult1_5_sub_5(SUB,657)@11 + 1
    u0_m0_wo2_mtree_mult1_5_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 19 => u0_m0_wo2_mtree_mult1_5_add_1_q(18)) & u0_m0_wo2_mtree_mult1_5_add_1_q));
    u0_m0_wo2_mtree_mult1_5_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo2_mtree_mult1_5_shift4_q(25)) & u0_m0_wo2_mtree_mult1_5_shift4_q));
    u0_m0_wo2_mtree_mult1_5_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_5_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_5_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_5_sub_5_a) - SIGNED(u0_m0_wo2_mtree_mult1_5_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_5_sub_5_q <= u0_m0_wo2_mtree_mult1_5_sub_5_o(26 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr18(DELAY,37)@10
    u0_m0_wo0_wi0_r0_delayr18 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr17_q, xout => u0_m0_wo0_wi0_r0_delayr18_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr18_q_11(DELAY,1028)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr18_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr18_q, xout => d_u0_m0_wo0_wi0_r0_delayr18_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_4_shift2(BITSHIFT,660)@11
    u0_m0_wo2_mtree_mult1_4_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr18_q_11_q & "0000";
    u0_m0_wo2_mtree_mult1_4_shift2_q <= u0_m0_wo2_mtree_mult1_4_shift2_qint(19 downto 0);

    -- u0_m0_wo2_mtree_mult1_4_shift0(BITSHIFT,658)@10
    u0_m0_wo2_mtree_mult1_4_shift0_qint <= u0_m0_wo0_wi0_r0_delayr18_q & "0";
    u0_m0_wo2_mtree_mult1_4_shift0_q <= u0_m0_wo2_mtree_mult1_4_shift0_qint(16 downto 0);

    -- u0_m0_wo2_mtree_mult1_4_add_1(ADD,659)@10 + 1
    u0_m0_wo2_mtree_mult1_4_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => u0_m0_wo0_wi0_r0_delayr18_q(15)) & u0_m0_wo0_wi0_r0_delayr18_q));
    u0_m0_wo2_mtree_mult1_4_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo2_mtree_mult1_4_shift0_q(16)) & u0_m0_wo2_mtree_mult1_4_shift0_q));
    u0_m0_wo2_mtree_mult1_4_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_4_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_4_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_4_add_1_a) + SIGNED(u0_m0_wo2_mtree_mult1_4_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_4_add_1_q <= u0_m0_wo2_mtree_mult1_4_add_1_o(17 downto 0);

    -- u0_m0_wo2_mtree_mult1_4_add_3(ADD,661)@11 + 1
    u0_m0_wo2_mtree_mult1_4_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 18 => u0_m0_wo2_mtree_mult1_4_add_1_q(17)) & u0_m0_wo2_mtree_mult1_4_add_1_q));
    u0_m0_wo2_mtree_mult1_4_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo2_mtree_mult1_4_shift2_q(19)) & u0_m0_wo2_mtree_mult1_4_shift2_q));
    u0_m0_wo2_mtree_mult1_4_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_4_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_4_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_4_add_3_a) + SIGNED(u0_m0_wo2_mtree_mult1_4_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_4_add_3_q <= u0_m0_wo2_mtree_mult1_4_add_3_o(20 downto 0);

    -- u0_m0_wo2_mtree_mult1_4_shift4(BITSHIFT,662)@12
    u0_m0_wo2_mtree_mult1_4_shift4_qint <= u0_m0_wo2_mtree_mult1_4_add_3_q & "00";
    u0_m0_wo2_mtree_mult1_4_shift4_q <= u0_m0_wo2_mtree_mult1_4_shift4_qint(22 downto 0);

    -- u0_m0_wo2_mtree_add0_2(ADD,285)@12 + 1
    u0_m0_wo2_mtree_add0_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 23 => u0_m0_wo2_mtree_mult1_4_shift4_q(22)) & u0_m0_wo2_mtree_mult1_4_shift4_q));
    u0_m0_wo2_mtree_add0_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo2_mtree_mult1_5_sub_5_q(26)) & u0_m0_wo2_mtree_mult1_5_sub_5_q));
    u0_m0_wo2_mtree_add0_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_2_a) + SIGNED(u0_m0_wo2_mtree_add0_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_2_q <= u0_m0_wo2_mtree_add0_2_o(27 downto 0);

    -- u0_m0_wo2_mtree_add1_1(ADD,295)@13 + 1
    u0_m0_wo2_mtree_add1_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo2_mtree_add0_2_q(27)) & u0_m0_wo2_mtree_add0_2_q));
    u0_m0_wo2_mtree_add1_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo2_mtree_add0_3_q(27)) & u0_m0_wo2_mtree_add0_3_q));
    u0_m0_wo2_mtree_add1_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add1_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add1_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add1_1_a) + SIGNED(u0_m0_wo2_mtree_add1_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add1_1_q <= u0_m0_wo2_mtree_add1_1_o(28 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr19(DELAY,38)@10
    u0_m0_wo0_wi0_r0_delayr19 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr18_q, xout => u0_m0_wo0_wi0_r0_delayr19_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr19_q_11(DELAY,1029)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr19_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr19_q, xout => d_u0_m0_wo0_wi0_r0_delayr19_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_3_shift0(BITSHIFT,663)@11
    u0_m0_wo2_mtree_mult1_3_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr19_q_11_q & "000000";
    u0_m0_wo2_mtree_mult1_3_shift0_q <= u0_m0_wo2_mtree_mult1_3_shift0_qint(21 downto 0);

    -- u0_m0_wo2_mtree_mult1_3_sub_1(SUB,664)@11 + 1
    u0_m0_wo2_mtree_mult1_3_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo2_mtree_mult1_3_shift0_q(21)) & u0_m0_wo2_mtree_mult1_3_shift0_q));
    u0_m0_wo2_mtree_mult1_3_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 16 => d_u0_m0_wo0_wi0_r0_delayr19_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr19_q_11_q));
    u0_m0_wo2_mtree_mult1_3_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_3_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_3_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_3_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_3_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_3_sub_1_q <= u0_m0_wo2_mtree_mult1_3_sub_1_o(22 downto 0);

    -- u0_m0_wo2_mtree_mult1_3_shift2(BITSHIFT,665)@12
    u0_m0_wo2_mtree_mult1_3_shift2_qint <= u0_m0_wo2_mtree_mult1_3_sub_1_q & "000";
    u0_m0_wo2_mtree_mult1_3_shift2_q <= u0_m0_wo2_mtree_mult1_3_shift2_qint(25 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr20(DELAY,39)@10
    u0_m0_wo0_wi0_r0_delayr20 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr19_q, xout => u0_m0_wo0_wi0_r0_delayr20_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_2_shift2(BITSHIFT,668)@10
    u0_m0_wo2_mtree_mult1_2_shift2_qint <= u0_m0_wo0_wi0_r0_delayr20_q & "000";
    u0_m0_wo2_mtree_mult1_2_shift2_q <= u0_m0_wo2_mtree_mult1_2_shift2_qint(18 downto 0);

    -- u0_m0_wo2_mtree_mult1_2_sub_3(SUB,669)@10 + 1
    u0_m0_wo2_mtree_mult1_2_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo2_mtree_mult1_2_shift2_q(18)) & u0_m0_wo2_mtree_mult1_2_shift2_q));
    u0_m0_wo2_mtree_mult1_2_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => u0_m0_wo0_wi0_r0_delayr20_q(15)) & u0_m0_wo0_wi0_r0_delayr20_q));
    u0_m0_wo2_mtree_mult1_2_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_2_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_2_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_2_sub_3_a) - SIGNED(u0_m0_wo2_mtree_mult1_2_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_2_sub_3_q <= u0_m0_wo2_mtree_mult1_2_sub_3_o(19 downto 0);

    -- u0_m0_wo2_mtree_mult1_2_shift4(BITSHIFT,670)@11
    u0_m0_wo2_mtree_mult1_2_shift4_qint <= u0_m0_wo2_mtree_mult1_2_sub_3_q & "0000";
    u0_m0_wo2_mtree_mult1_2_shift4_q <= u0_m0_wo2_mtree_mult1_2_shift4_qint(23 downto 0);

    -- u0_m0_wo2_mtree_mult1_2_shift0(BITSHIFT,666)@10
    u0_m0_wo2_mtree_mult1_2_shift0_qint <= u0_m0_wo0_wi0_r0_delayr20_q & "00";
    u0_m0_wo2_mtree_mult1_2_shift0_q <= u0_m0_wo2_mtree_mult1_2_shift0_qint(17 downto 0);

    -- u0_m0_wo2_mtree_mult1_2_sub_1(SUB,667)@10 + 1
    u0_m0_wo2_mtree_mult1_2_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo0_wi0_r0_delayr20_q(15)) & u0_m0_wo0_wi0_r0_delayr20_q));
    u0_m0_wo2_mtree_mult1_2_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo2_mtree_mult1_2_shift0_q(17)) & u0_m0_wo2_mtree_mult1_2_shift0_q));
    u0_m0_wo2_mtree_mult1_2_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_2_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_2_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_2_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_2_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_2_sub_1_q <= u0_m0_wo2_mtree_mult1_2_sub_1_o(18 downto 0);

    -- u0_m0_wo2_mtree_mult1_2_add_5(ADD,671)@11 + 1
    u0_m0_wo2_mtree_mult1_2_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 19 => u0_m0_wo2_mtree_mult1_2_sub_1_q(18)) & u0_m0_wo2_mtree_mult1_2_sub_1_q));
    u0_m0_wo2_mtree_mult1_2_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo2_mtree_mult1_2_shift4_q(23)) & u0_m0_wo2_mtree_mult1_2_shift4_q));
    u0_m0_wo2_mtree_mult1_2_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_2_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_2_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_2_add_5_a) + SIGNED(u0_m0_wo2_mtree_mult1_2_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_2_add_5_q <= u0_m0_wo2_mtree_mult1_2_add_5_o(24 downto 0);

    -- u0_m0_wo2_mtree_mult1_2_shift6(BITSHIFT,672)@12
    u0_m0_wo2_mtree_mult1_2_shift6_qint <= u0_m0_wo2_mtree_mult1_2_add_5_q & "0";
    u0_m0_wo2_mtree_mult1_2_shift6_q <= u0_m0_wo2_mtree_mult1_2_shift6_qint(25 downto 0);

    -- u0_m0_wo2_mtree_add0_1(ADD,284)@12 + 1
    u0_m0_wo2_mtree_add0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo2_mtree_mult1_2_shift6_q(25)) & u0_m0_wo2_mtree_mult1_2_shift6_q));
    u0_m0_wo2_mtree_add0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo2_mtree_mult1_3_shift2_q(25)) & u0_m0_wo2_mtree_mult1_3_shift2_q));
    u0_m0_wo2_mtree_add0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_1_a) + SIGNED(u0_m0_wo2_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_1_q <= u0_m0_wo2_mtree_add0_1_o(26 downto 0);

    -- u0_m0_wo2_mtree_mult1_1_shift0(BITSHIFT,673)@11
    u0_m0_wo2_mtree_mult1_1_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr21_q_11_q & "00";
    u0_m0_wo2_mtree_mult1_1_shift0_q <= u0_m0_wo2_mtree_mult1_1_shift0_qint(17 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr21(DELAY,40)@10
    u0_m0_wo0_wi0_r0_delayr21 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr20_q, xout => u0_m0_wo0_wi0_r0_delayr21_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr21_q_11(DELAY,1031)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr21_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr21_q, xout => d_u0_m0_wo0_wi0_r0_delayr21_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_1_sub_1(SUB,674)@11 + 1
    u0_m0_wo2_mtree_mult1_1_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => d_u0_m0_wo0_wi0_r0_delayr21_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr21_q_11_q));
    u0_m0_wo2_mtree_mult1_1_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo2_mtree_mult1_1_shift0_q(17)) & u0_m0_wo2_mtree_mult1_1_shift0_q));
    u0_m0_wo2_mtree_mult1_1_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_1_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_1_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_1_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_1_sub_1_q <= u0_m0_wo2_mtree_mult1_1_sub_1_o(18 downto 0);

    -- u0_m0_wo2_mtree_mult1_1_shift2(BITSHIFT,675)@12
    u0_m0_wo2_mtree_mult1_1_shift2_qint <= u0_m0_wo2_mtree_mult1_1_sub_1_q & "000";
    u0_m0_wo2_mtree_mult1_1_shift2_q <= u0_m0_wo2_mtree_mult1_1_shift2_qint(21 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr22(DELAY,41)@10
    u0_m0_wo0_wi0_r0_delayr22 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr21_q, xout => u0_m0_wo0_wi0_r0_delayr22_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr22_q_11(DELAY,1032)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr22_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr22_q, xout => d_u0_m0_wo0_wi0_r0_delayr22_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_0_shift2(BITSHIFT,678)@11
    u0_m0_wo2_mtree_mult1_0_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr22_q_11_q & "0000";
    u0_m0_wo2_mtree_mult1_0_shift2_q <= u0_m0_wo2_mtree_mult1_0_shift2_qint(19 downto 0);

    -- u0_m0_wo2_mtree_mult1_0_shift0(BITSHIFT,676)@10
    u0_m0_wo2_mtree_mult1_0_shift0_qint <= u0_m0_wo0_wi0_r0_delayr22_q & "00";
    u0_m0_wo2_mtree_mult1_0_shift0_q <= u0_m0_wo2_mtree_mult1_0_shift0_qint(17 downto 0);

    -- u0_m0_wo2_mtree_mult1_0_sub_1(SUB,677)@10 + 1
    u0_m0_wo2_mtree_mult1_0_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 1 => GND_q(0)) & GND_q));
    u0_m0_wo2_mtree_mult1_0_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo2_mtree_mult1_0_shift0_q(17)) & u0_m0_wo2_mtree_mult1_0_shift0_q));
    u0_m0_wo2_mtree_mult1_0_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_0_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_0_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_0_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_0_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_0_sub_1_q <= u0_m0_wo2_mtree_mult1_0_sub_1_o(18 downto 0);

    -- u0_m0_wo2_mtree_mult1_0_sub_3(SUB,679)@11 + 1
    u0_m0_wo2_mtree_mult1_0_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => u0_m0_wo2_mtree_mult1_0_sub_1_q(18)) & u0_m0_wo2_mtree_mult1_0_sub_1_q));
    u0_m0_wo2_mtree_mult1_0_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo2_mtree_mult1_0_shift2_q(19)) & u0_m0_wo2_mtree_mult1_0_shift2_q));
    u0_m0_wo2_mtree_mult1_0_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_0_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_0_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_0_sub_3_a) - SIGNED(u0_m0_wo2_mtree_mult1_0_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_0_sub_3_q <= u0_m0_wo2_mtree_mult1_0_sub_3_o(20 downto 0);

    -- u0_m0_wo2_mtree_add0_0(ADD,283)@12 + 1
    u0_m0_wo2_mtree_add0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 21 => u0_m0_wo2_mtree_mult1_0_sub_3_q(20)) & u0_m0_wo2_mtree_mult1_0_sub_3_q));
    u0_m0_wo2_mtree_add0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo2_mtree_mult1_1_shift2_q(21)) & u0_m0_wo2_mtree_mult1_1_shift2_q));
    u0_m0_wo2_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_0_a) + SIGNED(u0_m0_wo2_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_0_q <= u0_m0_wo2_mtree_add0_0_o(22 downto 0);

    -- u0_m0_wo2_mtree_add1_0(ADD,294)@13 + 1
    u0_m0_wo2_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 23 => u0_m0_wo2_mtree_add0_0_q(22)) & u0_m0_wo2_mtree_add0_0_q));
    u0_m0_wo2_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo2_mtree_add0_1_q(26)) & u0_m0_wo2_mtree_add0_1_q));
    u0_m0_wo2_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add1_0_a) + SIGNED(u0_m0_wo2_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add1_0_q <= u0_m0_wo2_mtree_add1_0_o(27 downto 0);

    -- u0_m0_wo2_mtree_add2_0(ADD,300)@14 + 1
    u0_m0_wo2_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 28 => u0_m0_wo2_mtree_add1_0_q(27)) & u0_m0_wo2_mtree_add1_0_q));
    u0_m0_wo2_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo2_mtree_add1_1_q(28)) & u0_m0_wo2_mtree_add1_1_q));
    u0_m0_wo2_mtree_add2_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add2_0_a) + SIGNED(u0_m0_wo2_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add2_0_q <= u0_m0_wo2_mtree_add2_0_o(29 downto 0);

    -- u0_m0_wo2_mtree_add3_0(ADD,303)@15 + 1
    u0_m0_wo2_mtree_add3_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 30 => u0_m0_wo2_mtree_add2_0_q(29)) & u0_m0_wo2_mtree_add2_0_q));
    u0_m0_wo2_mtree_add3_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo2_mtree_add2_1_q(32)) & u0_m0_wo2_mtree_add2_1_q));
    u0_m0_wo2_mtree_add3_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add3_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add3_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add3_0_a) + SIGNED(u0_m0_wo2_mtree_add3_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add3_0_q <= u0_m0_wo2_mtree_add3_0_o(33 downto 0);

    -- u0_m0_wo2_mtree_add4_0(ADD,304)@16 + 1
    u0_m0_wo2_mtree_add4_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 34 => u0_m0_wo2_mtree_add3_0_q(33)) & u0_m0_wo2_mtree_add3_0_q));
    u0_m0_wo2_mtree_add4_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 30 => u0_m0_wo2_mtree_add2_2_q(29)) & u0_m0_wo2_mtree_add2_2_q));
    u0_m0_wo2_mtree_add4_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add4_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add4_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add4_0_a) + SIGNED(u0_m0_wo2_mtree_add4_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add4_0_q <= u0_m0_wo2_mtree_add4_0_o(34 downto 0);

    -- u0_m0_wo1_mtree_mult1_22_shift2(BITSHIFT,400)@13
    u0_m0_wo1_mtree_mult1_22_shift2_qint <= d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q & "0000";
    u0_m0_wo1_mtree_mult1_22_shift2_q <= u0_m0_wo1_mtree_mult1_22_shift2_qint(19 downto 0);

    -- u0_m0_wo1_mtree_mult1_22_shift0(BITSHIFT,398)@12
    u0_m0_wo1_mtree_mult1_22_shift0_qint <= d_u0_m0_wo0_wi0_r0_phasedelay0_q_12_q & "00";
    u0_m0_wo1_mtree_mult1_22_shift0_q <= u0_m0_wo1_mtree_mult1_22_shift0_qint(17 downto 0);

    -- u0_m0_wo1_mtree_mult1_22_sub_1(SUB,399)@12 + 1
    u0_m0_wo1_mtree_mult1_22_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 1 => GND_q(0)) & GND_q));
    u0_m0_wo1_mtree_mult1_22_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo1_mtree_mult1_22_shift0_q(17)) & u0_m0_wo1_mtree_mult1_22_shift0_q));
    u0_m0_wo1_mtree_mult1_22_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_22_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_22_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_22_sub_1_a) - SIGNED(u0_m0_wo1_mtree_mult1_22_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_22_sub_1_q <= u0_m0_wo1_mtree_mult1_22_sub_1_o(18 downto 0);

    -- u0_m0_wo1_mtree_mult1_22_sub_3(SUB,401)@13 + 1
    u0_m0_wo1_mtree_mult1_22_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => u0_m0_wo1_mtree_mult1_22_sub_1_q(18)) & u0_m0_wo1_mtree_mult1_22_sub_1_q));
    u0_m0_wo1_mtree_mult1_22_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo1_mtree_mult1_22_shift2_q(19)) & u0_m0_wo1_mtree_mult1_22_shift2_q));
    u0_m0_wo1_mtree_mult1_22_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_22_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_22_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_22_sub_3_a) - SIGNED(u0_m0_wo1_mtree_mult1_22_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_22_sub_3_q <= u0_m0_wo1_mtree_mult1_22_sub_3_o(20 downto 0);

    -- u0_m0_wo1_mtree_mult1_21_shift0(BITSHIFT,402)@12
    u0_m0_wo1_mtree_mult1_21_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr1_q_12_q & "00";
    u0_m0_wo1_mtree_mult1_21_shift0_q <= u0_m0_wo1_mtree_mult1_21_shift0_qint(17 downto 0);

    -- u0_m0_wo1_mtree_mult1_21_sub_1(SUB,403)@12 + 1
    u0_m0_wo1_mtree_mult1_21_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => d_u0_m0_wo0_wi0_r0_delayr1_q_12_q(15)) & d_u0_m0_wo0_wi0_r0_delayr1_q_12_q));
    u0_m0_wo1_mtree_mult1_21_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo1_mtree_mult1_21_shift0_q(17)) & u0_m0_wo1_mtree_mult1_21_shift0_q));
    u0_m0_wo1_mtree_mult1_21_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_21_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_21_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_21_sub_1_a) - SIGNED(u0_m0_wo1_mtree_mult1_21_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_21_sub_1_q <= u0_m0_wo1_mtree_mult1_21_sub_1_o(18 downto 0);

    -- u0_m0_wo1_mtree_mult1_21_shift2(BITSHIFT,404)@13
    u0_m0_wo1_mtree_mult1_21_shift2_qint <= u0_m0_wo1_mtree_mult1_21_sub_1_q & "000";
    u0_m0_wo1_mtree_mult1_21_shift2_q <= u0_m0_wo1_mtree_mult1_21_shift2_qint(21 downto 0);

    -- u0_m0_wo1_mtree_mult1_20_shift2(BITSHIFT,407)@11
    u0_m0_wo1_mtree_mult1_20_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr2_q_11_q & "000";
    u0_m0_wo1_mtree_mult1_20_shift2_q <= u0_m0_wo1_mtree_mult1_20_shift2_qint(18 downto 0);

    -- u0_m0_wo1_mtree_mult1_20_sub_3(SUB,408)@11 + 1
    u0_m0_wo1_mtree_mult1_20_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo1_mtree_mult1_20_shift2_q(18)) & u0_m0_wo1_mtree_mult1_20_shift2_q));
    u0_m0_wo1_mtree_mult1_20_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => d_u0_m0_wo0_wi0_r0_delayr2_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr2_q_11_q));
    u0_m0_wo1_mtree_mult1_20_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_20_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_20_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_20_sub_3_a) - SIGNED(u0_m0_wo1_mtree_mult1_20_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_20_sub_3_q <= u0_m0_wo1_mtree_mult1_20_sub_3_o(19 downto 0);

    -- u0_m0_wo1_mtree_mult1_20_shift4(BITSHIFT,409)@12
    u0_m0_wo1_mtree_mult1_20_shift4_qint <= u0_m0_wo1_mtree_mult1_20_sub_3_q & "0000";
    u0_m0_wo1_mtree_mult1_20_shift4_q <= u0_m0_wo1_mtree_mult1_20_shift4_qint(23 downto 0);

    -- u0_m0_wo1_mtree_mult1_20_shift0(BITSHIFT,405)@11
    u0_m0_wo1_mtree_mult1_20_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr2_q_11_q & "00";
    u0_m0_wo1_mtree_mult1_20_shift0_q <= u0_m0_wo1_mtree_mult1_20_shift0_qint(17 downto 0);

    -- u0_m0_wo1_mtree_mult1_20_sub_1(SUB,406)@11 + 1
    u0_m0_wo1_mtree_mult1_20_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => d_u0_m0_wo0_wi0_r0_delayr2_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr2_q_11_q));
    u0_m0_wo1_mtree_mult1_20_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo1_mtree_mult1_20_shift0_q(17)) & u0_m0_wo1_mtree_mult1_20_shift0_q));
    u0_m0_wo1_mtree_mult1_20_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_20_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_20_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_20_sub_1_a) - SIGNED(u0_m0_wo1_mtree_mult1_20_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_20_sub_1_q <= u0_m0_wo1_mtree_mult1_20_sub_1_o(18 downto 0);

    -- u0_m0_wo1_mtree_mult1_20_add_5(ADD,410)@12 + 1
    u0_m0_wo1_mtree_mult1_20_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 19 => u0_m0_wo1_mtree_mult1_20_sub_1_q(18)) & u0_m0_wo1_mtree_mult1_20_sub_1_q));
    u0_m0_wo1_mtree_mult1_20_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo1_mtree_mult1_20_shift4_q(23)) & u0_m0_wo1_mtree_mult1_20_shift4_q));
    u0_m0_wo1_mtree_mult1_20_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_20_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_20_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_20_add_5_a) + SIGNED(u0_m0_wo1_mtree_mult1_20_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_20_add_5_q <= u0_m0_wo1_mtree_mult1_20_add_5_o(24 downto 0);

    -- u0_m0_wo1_mtree_mult1_20_shift6(BITSHIFT,411)@13
    u0_m0_wo1_mtree_mult1_20_shift6_qint <= u0_m0_wo1_mtree_mult1_20_add_5_q & "0";
    u0_m0_wo1_mtree_mult1_20_shift6_q <= u0_m0_wo1_mtree_mult1_20_shift6_qint(25 downto 0);

    -- u0_m0_wo1_mtree_add0_10(ADD,187)@13 + 1
    u0_m0_wo1_mtree_add0_10_a <= STD_LOGIC_VECTOR(u0_m0_wo1_mtree_mult1_20_shift6_q);
    u0_m0_wo1_mtree_add0_10_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 22 => u0_m0_wo1_mtree_mult1_21_shift2_q(21)) & u0_m0_wo1_mtree_mult1_21_shift2_q));
    u0_m0_wo1_mtree_add0_10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_10_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_10_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_10_a) + SIGNED(u0_m0_wo1_mtree_add0_10_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_10_q <= u0_m0_wo1_mtree_add0_10_o(25 downto 0);

    -- u0_m0_wo1_mtree_add1_5(ADD,193)@14 + 1
    u0_m0_wo1_mtree_add1_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo1_mtree_add0_10_q(25)) & u0_m0_wo1_mtree_add0_10_q));
    u0_m0_wo1_mtree_add1_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 21 => u0_m0_wo1_mtree_mult1_22_sub_3_q(20)) & u0_m0_wo1_mtree_mult1_22_sub_3_q));
    u0_m0_wo1_mtree_add1_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add1_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add1_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add1_5_a) + SIGNED(u0_m0_wo1_mtree_add1_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add1_5_q <= u0_m0_wo1_mtree_add1_5_o(26 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr3_q_12(DELAY,1016)@11 + 1
    d_u0_m0_wo0_wi0_r0_delayr3_q_12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr3_q_11_q, xout => d_u0_m0_wo0_wi0_r0_delayr3_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_mtree_mult1_19_shift0(BITSHIFT,412)@12
    u0_m0_wo1_mtree_mult1_19_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr3_q_12_q & "000000";
    u0_m0_wo1_mtree_mult1_19_shift0_q <= u0_m0_wo1_mtree_mult1_19_shift0_qint(21 downto 0);

    -- u0_m0_wo1_mtree_mult1_19_sub_1(SUB,413)@12 + 1
    u0_m0_wo1_mtree_mult1_19_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo1_mtree_mult1_19_shift0_q(21)) & u0_m0_wo1_mtree_mult1_19_shift0_q));
    u0_m0_wo1_mtree_mult1_19_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 16 => d_u0_m0_wo0_wi0_r0_delayr3_q_12_q(15)) & d_u0_m0_wo0_wi0_r0_delayr3_q_12_q));
    u0_m0_wo1_mtree_mult1_19_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_19_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_19_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_19_sub_1_a) - SIGNED(u0_m0_wo1_mtree_mult1_19_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_19_sub_1_q <= u0_m0_wo1_mtree_mult1_19_sub_1_o(22 downto 0);

    -- u0_m0_wo1_mtree_mult1_19_shift2(BITSHIFT,414)@13
    u0_m0_wo1_mtree_mult1_19_shift2_qint <= u0_m0_wo1_mtree_mult1_19_sub_1_q & "000";
    u0_m0_wo1_mtree_mult1_19_shift2_q <= u0_m0_wo1_mtree_mult1_19_shift2_qint(25 downto 0);

    -- u0_m0_wo1_mtree_mult1_18_shift2(BITSHIFT,417)@12
    u0_m0_wo1_mtree_mult1_18_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr4_q_12_q & "0000";
    u0_m0_wo1_mtree_mult1_18_shift2_q <= u0_m0_wo1_mtree_mult1_18_shift2_qint(19 downto 0);

    -- u0_m0_wo1_mtree_mult1_18_shift0(BITSHIFT,415)@11
    u0_m0_wo1_mtree_mult1_18_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr4_q_11_q & "0";
    u0_m0_wo1_mtree_mult1_18_shift0_q <= u0_m0_wo1_mtree_mult1_18_shift0_qint(16 downto 0);

    -- u0_m0_wo1_mtree_mult1_18_add_1(ADD,416)@11 + 1
    u0_m0_wo1_mtree_mult1_18_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => d_u0_m0_wo0_wi0_r0_delayr4_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr4_q_11_q));
    u0_m0_wo1_mtree_mult1_18_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo1_mtree_mult1_18_shift0_q(16)) & u0_m0_wo1_mtree_mult1_18_shift0_q));
    u0_m0_wo1_mtree_mult1_18_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_18_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_18_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_18_add_1_a) + SIGNED(u0_m0_wo1_mtree_mult1_18_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_18_add_1_q <= u0_m0_wo1_mtree_mult1_18_add_1_o(17 downto 0);

    -- u0_m0_wo1_mtree_mult1_18_add_3(ADD,418)@12 + 1
    u0_m0_wo1_mtree_mult1_18_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 18 => u0_m0_wo1_mtree_mult1_18_add_1_q(17)) & u0_m0_wo1_mtree_mult1_18_add_1_q));
    u0_m0_wo1_mtree_mult1_18_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo1_mtree_mult1_18_shift2_q(19)) & u0_m0_wo1_mtree_mult1_18_shift2_q));
    u0_m0_wo1_mtree_mult1_18_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_18_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_18_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_18_add_3_a) + SIGNED(u0_m0_wo1_mtree_mult1_18_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_18_add_3_q <= u0_m0_wo1_mtree_mult1_18_add_3_o(20 downto 0);

    -- u0_m0_wo1_mtree_mult1_18_shift4(BITSHIFT,419)@13
    u0_m0_wo1_mtree_mult1_18_shift4_qint <= u0_m0_wo1_mtree_mult1_18_add_3_q & "00";
    u0_m0_wo1_mtree_mult1_18_shift4_q <= u0_m0_wo1_mtree_mult1_18_shift4_qint(22 downto 0);

    -- u0_m0_wo1_mtree_add0_9(ADD,186)@13 + 1
    u0_m0_wo1_mtree_add0_9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 23 => u0_m0_wo1_mtree_mult1_18_shift4_q(22)) & u0_m0_wo1_mtree_mult1_18_shift4_q));
    u0_m0_wo1_mtree_add0_9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo1_mtree_mult1_19_shift2_q(25)) & u0_m0_wo1_mtree_mult1_19_shift2_q));
    u0_m0_wo1_mtree_add0_9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_9_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_9_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_9_a) + SIGNED(u0_m0_wo1_mtree_add0_9_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_9_q <= u0_m0_wo1_mtree_add0_9_o(26 downto 0);

    -- u0_m0_wo1_mtree_mult1_17_shift2(BITSHIFT,422)@11
    u0_m0_wo1_mtree_mult1_17_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr5_q_11_q & "00000";
    u0_m0_wo1_mtree_mult1_17_shift2_q <= u0_m0_wo1_mtree_mult1_17_shift2_qint(20 downto 0);

    -- u0_m0_wo1_mtree_mult1_17_add_3(ADD,423)@11 + 1
    u0_m0_wo1_mtree_mult1_17_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 16 => d_u0_m0_wo0_wi0_r0_delayr5_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr5_q_11_q));
    u0_m0_wo1_mtree_mult1_17_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo1_mtree_mult1_17_shift2_q(20)) & u0_m0_wo1_mtree_mult1_17_shift2_q));
    u0_m0_wo1_mtree_mult1_17_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_17_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_17_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_17_add_3_a) + SIGNED(u0_m0_wo1_mtree_mult1_17_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_17_add_3_q <= u0_m0_wo1_mtree_mult1_17_add_3_o(21 downto 0);

    -- u0_m0_wo1_mtree_mult1_17_shift4(BITSHIFT,424)@12
    u0_m0_wo1_mtree_mult1_17_shift4_qint <= u0_m0_wo1_mtree_mult1_17_add_3_q & "0000";
    u0_m0_wo1_mtree_mult1_17_shift4_q <= u0_m0_wo1_mtree_mult1_17_shift4_qint(25 downto 0);

    -- u0_m0_wo1_mtree_mult1_17_shift0(BITSHIFT,420)@11
    u0_m0_wo1_mtree_mult1_17_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr5_q_11_q & "00";
    u0_m0_wo1_mtree_mult1_17_shift0_q <= u0_m0_wo1_mtree_mult1_17_shift0_qint(17 downto 0);

    -- u0_m0_wo1_mtree_mult1_17_add_1(ADD,421)@11 + 1
    u0_m0_wo1_mtree_mult1_17_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => d_u0_m0_wo0_wi0_r0_delayr5_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr5_q_11_q));
    u0_m0_wo1_mtree_mult1_17_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo1_mtree_mult1_17_shift0_q(17)) & u0_m0_wo1_mtree_mult1_17_shift0_q));
    u0_m0_wo1_mtree_mult1_17_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_17_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_17_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_17_add_1_a) + SIGNED(u0_m0_wo1_mtree_mult1_17_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_17_add_1_q <= u0_m0_wo1_mtree_mult1_17_add_1_o(18 downto 0);

    -- u0_m0_wo1_mtree_mult1_17_sub_5(SUB,425)@12 + 1
    u0_m0_wo1_mtree_mult1_17_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 19 => u0_m0_wo1_mtree_mult1_17_add_1_q(18)) & u0_m0_wo1_mtree_mult1_17_add_1_q));
    u0_m0_wo1_mtree_mult1_17_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo1_mtree_mult1_17_shift4_q(25)) & u0_m0_wo1_mtree_mult1_17_shift4_q));
    u0_m0_wo1_mtree_mult1_17_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_17_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_17_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_17_sub_5_a) - SIGNED(u0_m0_wo1_mtree_mult1_17_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_17_sub_5_q <= u0_m0_wo1_mtree_mult1_17_sub_5_o(26 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr6_q_12(DELAY,1022)@11 + 1
    d_u0_m0_wo0_wi0_r0_delayr6_q_12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr6_q_11_q, xout => d_u0_m0_wo0_wi0_r0_delayr6_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_mtree_mult1_16_shift2(BITSHIFT,428)@12
    u0_m0_wo1_mtree_mult1_16_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr6_q_12_q & "00000";
    u0_m0_wo1_mtree_mult1_16_shift2_q <= u0_m0_wo1_mtree_mult1_16_shift2_qint(20 downto 0);

    -- u0_m0_wo1_mtree_mult1_16_shift0(BITSHIFT,426)@11
    u0_m0_wo1_mtree_mult1_16_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr6_q_11_q & "0000";
    u0_m0_wo1_mtree_mult1_16_shift0_q <= u0_m0_wo1_mtree_mult1_16_shift0_qint(19 downto 0);

    -- u0_m0_wo1_mtree_mult1_16_add_1(ADD,427)@11 + 1
    u0_m0_wo1_mtree_mult1_16_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 16 => d_u0_m0_wo0_wi0_r0_delayr6_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr6_q_11_q));
    u0_m0_wo1_mtree_mult1_16_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo1_mtree_mult1_16_shift0_q(19)) & u0_m0_wo1_mtree_mult1_16_shift0_q));
    u0_m0_wo1_mtree_mult1_16_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_16_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_16_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_16_add_1_a) + SIGNED(u0_m0_wo1_mtree_mult1_16_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_16_add_1_q <= u0_m0_wo1_mtree_mult1_16_add_1_o(20 downto 0);

    -- u0_m0_wo1_mtree_mult1_16_add_3(ADD,429)@12 + 1
    u0_m0_wo1_mtree_mult1_16_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo1_mtree_mult1_16_add_1_q(20)) & u0_m0_wo1_mtree_mult1_16_add_1_q));
    u0_m0_wo1_mtree_mult1_16_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo1_mtree_mult1_16_shift2_q(20)) & u0_m0_wo1_mtree_mult1_16_shift2_q));
    u0_m0_wo1_mtree_mult1_16_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_16_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_16_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_16_add_3_a) + SIGNED(u0_m0_wo1_mtree_mult1_16_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_16_add_3_q <= u0_m0_wo1_mtree_mult1_16_add_3_o(21 downto 0);

    -- u0_m0_wo1_mtree_mult1_16_shift4(BITSHIFT,430)@13
    u0_m0_wo1_mtree_mult1_16_shift4_qint <= u0_m0_wo1_mtree_mult1_16_add_3_q & "00";
    u0_m0_wo1_mtree_mult1_16_shift4_q <= u0_m0_wo1_mtree_mult1_16_shift4_qint(23 downto 0);

    -- u0_m0_wo1_mtree_add0_8(ADD,185)@13 + 1
    u0_m0_wo1_mtree_add0_8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 24 => u0_m0_wo1_mtree_mult1_16_shift4_q(23)) & u0_m0_wo1_mtree_mult1_16_shift4_q));
    u0_m0_wo1_mtree_add0_8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo1_mtree_mult1_17_sub_5_q(26)) & u0_m0_wo1_mtree_mult1_17_sub_5_q));
    u0_m0_wo1_mtree_add0_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_8_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_8_a) + SIGNED(u0_m0_wo1_mtree_add0_8_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_8_q <= u0_m0_wo1_mtree_add0_8_o(27 downto 0);

    -- u0_m0_wo1_mtree_add1_4(ADD,192)@14 + 1
    u0_m0_wo1_mtree_add1_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo1_mtree_add0_8_q(27)) & u0_m0_wo1_mtree_add0_8_q));
    u0_m0_wo1_mtree_add1_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 27 => u0_m0_wo1_mtree_add0_9_q(26)) & u0_m0_wo1_mtree_add0_9_q));
    u0_m0_wo1_mtree_add1_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add1_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add1_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add1_4_a) + SIGNED(u0_m0_wo1_mtree_add1_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add1_4_q <= u0_m0_wo1_mtree_add1_4_o(28 downto 0);

    -- u0_m0_wo1_mtree_add2_2(ADD,196)@15 + 1
    u0_m0_wo1_mtree_add2_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo1_mtree_add1_4_q(28)) & u0_m0_wo1_mtree_add1_4_q));
    u0_m0_wo1_mtree_add2_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 27 => u0_m0_wo1_mtree_add1_5_q(26)) & u0_m0_wo1_mtree_add1_5_q));
    u0_m0_wo1_mtree_add2_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add2_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add2_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add2_2_a) + SIGNED(u0_m0_wo1_mtree_add2_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add2_2_q <= u0_m0_wo1_mtree_add2_2_o(29 downto 0);

    -- u0_m0_wo1_mtree_mult1_15(MULT,161)@10 + 2
    u0_m0_wo1_mtree_mult1_15_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm7_q);
    u0_m0_wo1_mtree_mult1_15_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr7_q);
    u0_m0_wo1_mtree_mult1_15_reset <= areset;
    u0_m0_wo1_mtree_mult1_15_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 11,
        lpm_widthb => 16,
        lpm_widthp => 27,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo1_mtree_mult1_15_a0,
        datab => u0_m0_wo1_mtree_mult1_15_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo1_mtree_mult1_15_reset,
        clock => clk,
        result => u0_m0_wo1_mtree_mult1_15_s1
    );
    u0_m0_wo1_mtree_mult1_15_q <= u0_m0_wo1_mtree_mult1_15_s1;

    -- u0_m0_wo1_mtree_mult1_14(MULT,162)@10 + 2
    u0_m0_wo1_mtree_mult1_14_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm8_q);
    u0_m0_wo1_mtree_mult1_14_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr8_q);
    u0_m0_wo1_mtree_mult1_14_reset <= areset;
    u0_m0_wo1_mtree_mult1_14_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 11,
        lpm_widthb => 16,
        lpm_widthp => 27,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo1_mtree_mult1_14_a0,
        datab => u0_m0_wo1_mtree_mult1_14_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo1_mtree_mult1_14_reset,
        clock => clk,
        result => u0_m0_wo1_mtree_mult1_14_s1
    );
    u0_m0_wo1_mtree_mult1_14_q <= u0_m0_wo1_mtree_mult1_14_s1;

    -- u0_m0_wo1_mtree_add0_7(ADD,184)@12 + 1
    u0_m0_wo1_mtree_add0_7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo1_mtree_mult1_14_q(26)) & u0_m0_wo1_mtree_mult1_14_q));
    u0_m0_wo1_mtree_add0_7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo1_mtree_mult1_15_q(26)) & u0_m0_wo1_mtree_mult1_15_q));
    u0_m0_wo1_mtree_add0_7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_7_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_7_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_7_a) + SIGNED(u0_m0_wo1_mtree_add0_7_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_7_q <= u0_m0_wo1_mtree_add0_7_o(27 downto 0);

    -- u0_m0_wo1_mtree_mult1_13(MULT,163)@10 + 2
    u0_m0_wo1_mtree_mult1_13_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm9_q);
    u0_m0_wo1_mtree_mult1_13_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr9_q);
    u0_m0_wo1_mtree_mult1_13_reset <= areset;
    u0_m0_wo1_mtree_mult1_13_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 16,
        lpm_widthp => 28,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo1_mtree_mult1_13_a0,
        datab => u0_m0_wo1_mtree_mult1_13_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo1_mtree_mult1_13_reset,
        clock => clk,
        result => u0_m0_wo1_mtree_mult1_13_s1
    );
    u0_m0_wo1_mtree_mult1_13_q <= u0_m0_wo1_mtree_mult1_13_s1;

    -- u0_m0_wo1_mtree_mult1_12(MULT,164)@10 + 2
    u0_m0_wo1_mtree_mult1_12_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm10_q);
    u0_m0_wo1_mtree_mult1_12_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr10_q);
    u0_m0_wo1_mtree_mult1_12_reset <= areset;
    u0_m0_wo1_mtree_mult1_12_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 13,
        lpm_widthb => 16,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo1_mtree_mult1_12_a0,
        datab => u0_m0_wo1_mtree_mult1_12_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo1_mtree_mult1_12_reset,
        clock => clk,
        result => u0_m0_wo1_mtree_mult1_12_s1
    );
    u0_m0_wo1_mtree_mult1_12_q <= u0_m0_wo1_mtree_mult1_12_s1;

    -- u0_m0_wo1_mtree_add0_6(ADD,183)@12 + 1
    u0_m0_wo1_mtree_add0_6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo1_mtree_mult1_12_q(28)) & u0_m0_wo1_mtree_mult1_12_q));
    u0_m0_wo1_mtree_add0_6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 28 => u0_m0_wo1_mtree_mult1_13_q(27)) & u0_m0_wo1_mtree_mult1_13_q));
    u0_m0_wo1_mtree_add0_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_6_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_6_a) + SIGNED(u0_m0_wo1_mtree_add0_6_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_6_q <= u0_m0_wo1_mtree_add0_6_o(29 downto 0);

    -- u0_m0_wo1_mtree_add1_3(ADD,191)@13 + 1
    u0_m0_wo1_mtree_add1_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo1_mtree_add0_6_q(29)) & u0_m0_wo1_mtree_add0_6_q));
    u0_m0_wo1_mtree_add1_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 28 => u0_m0_wo1_mtree_add0_7_q(27)) & u0_m0_wo1_mtree_add0_7_q));
    u0_m0_wo1_mtree_add1_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add1_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add1_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add1_3_a) + SIGNED(u0_m0_wo1_mtree_add1_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add1_3_q <= u0_m0_wo1_mtree_add1_3_o(30 downto 0);

    -- u0_m0_wo1_mtree_mult1_11_shift0(BITSHIFT,468)@11
    u0_m0_wo1_mtree_mult1_11_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr11_q_11_q & "0000000000000";
    u0_m0_wo1_mtree_mult1_11_shift0_q <= u0_m0_wo1_mtree_mult1_11_shift0_qint(28 downto 0);

    -- u0_m0_wo1_mtree_mult1_11_sub_1(SUB,469)@11 + 1
    u0_m0_wo1_mtree_mult1_11_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo1_mtree_mult1_11_shift0_q(28)) & u0_m0_wo1_mtree_mult1_11_shift0_q));
    u0_m0_wo1_mtree_mult1_11_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 16 => d_u0_m0_wo0_wi0_r0_delayr11_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr11_q_11_q));
    u0_m0_wo1_mtree_mult1_11_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_11_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_11_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_11_sub_1_a) - SIGNED(u0_m0_wo1_mtree_mult1_11_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_11_sub_1_q <= u0_m0_wo1_mtree_mult1_11_sub_1_o(29 downto 0);

    -- u0_m0_wo1_mtree_mult1_10(MULT,166)@10 + 2
    u0_m0_wo1_mtree_mult1_10_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm12_q);
    u0_m0_wo1_mtree_mult1_10_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr12_q);
    u0_m0_wo1_mtree_mult1_10_reset <= areset;
    u0_m0_wo1_mtree_mult1_10_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 14,
        lpm_widthb => 16,
        lpm_widthp => 30,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo1_mtree_mult1_10_a0,
        datab => u0_m0_wo1_mtree_mult1_10_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo1_mtree_mult1_10_reset,
        clock => clk,
        result => u0_m0_wo1_mtree_mult1_10_s1
    );
    u0_m0_wo1_mtree_mult1_10_q <= u0_m0_wo1_mtree_mult1_10_s1;

    -- u0_m0_wo1_mtree_add0_5(ADD,182)@12 + 1
    u0_m0_wo1_mtree_add0_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo1_mtree_mult1_10_q(29)) & u0_m0_wo1_mtree_mult1_10_q));
    u0_m0_wo1_mtree_add0_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo1_mtree_mult1_11_sub_1_q(29)) & u0_m0_wo1_mtree_mult1_11_sub_1_q));
    u0_m0_wo1_mtree_add0_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_5_a) + SIGNED(u0_m0_wo1_mtree_add0_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_5_q <= u0_m0_wo1_mtree_add0_5_o(30 downto 0);

    -- u0_m0_wo1_mtree_mult1_9_shift2(BITSHIFT,484)@10
    u0_m0_wo1_mtree_mult1_9_shift2_qint <= u0_m0_wo0_wi0_r0_delayr13_q & "0000";
    u0_m0_wo1_mtree_mult1_9_shift2_q <= u0_m0_wo1_mtree_mult1_9_shift2_qint(19 downto 0);

    -- u0_m0_wo1_mtree_mult1_9_add_3(ADD,485)@10 + 1
    u0_m0_wo1_mtree_mult1_9_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 16 => u0_m0_wo0_wi0_r0_delayr13_q(15)) & u0_m0_wo0_wi0_r0_delayr13_q));
    u0_m0_wo1_mtree_mult1_9_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo1_mtree_mult1_9_shift2_q(19)) & u0_m0_wo1_mtree_mult1_9_shift2_q));
    u0_m0_wo1_mtree_mult1_9_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_9_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_9_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_9_add_3_a) + SIGNED(u0_m0_wo1_mtree_mult1_9_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_9_add_3_q <= u0_m0_wo1_mtree_mult1_9_add_3_o(20 downto 0);

    -- u0_m0_wo1_mtree_mult1_9_shift4(BITSHIFT,486)@11
    u0_m0_wo1_mtree_mult1_9_shift4_qint <= u0_m0_wo1_mtree_mult1_9_add_3_q & "0000";
    u0_m0_wo1_mtree_mult1_9_shift4_q <= u0_m0_wo1_mtree_mult1_9_shift4_qint(24 downto 0);

    -- u0_m0_wo1_mtree_mult1_9_shift0(BITSHIFT,482)@10
    u0_m0_wo1_mtree_mult1_9_shift0_qint <= u0_m0_wo0_wi0_r0_delayr13_q & "00";
    u0_m0_wo1_mtree_mult1_9_shift0_q <= u0_m0_wo1_mtree_mult1_9_shift0_qint(17 downto 0);

    -- u0_m0_wo1_mtree_mult1_9_sub_1(SUB,483)@10 + 1
    u0_m0_wo1_mtree_mult1_9_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 1 => GND_q(0)) & GND_q));
    u0_m0_wo1_mtree_mult1_9_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo1_mtree_mult1_9_shift0_q(17)) & u0_m0_wo1_mtree_mult1_9_shift0_q));
    u0_m0_wo1_mtree_mult1_9_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_9_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_9_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_9_sub_1_a) - SIGNED(u0_m0_wo1_mtree_mult1_9_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_9_sub_1_q <= u0_m0_wo1_mtree_mult1_9_sub_1_o(18 downto 0);

    -- u0_m0_wo1_mtree_mult1_9_sub_5(SUB,487)@11 + 1
    u0_m0_wo1_mtree_mult1_9_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 19 => u0_m0_wo1_mtree_mult1_9_sub_1_q(18)) & u0_m0_wo1_mtree_mult1_9_sub_1_q));
    u0_m0_wo1_mtree_mult1_9_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo1_mtree_mult1_9_shift4_q(24)) & u0_m0_wo1_mtree_mult1_9_shift4_q));
    u0_m0_wo1_mtree_mult1_9_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_9_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_9_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_9_sub_5_a) - SIGNED(u0_m0_wo1_mtree_mult1_9_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_9_sub_5_q <= u0_m0_wo1_mtree_mult1_9_sub_5_o(25 downto 0);

    -- u0_m0_wo1_mtree_mult1_8(MULT,168)@10 + 2
    u0_m0_wo1_mtree_mult1_8_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm14_q);
    u0_m0_wo1_mtree_mult1_8_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr14_q);
    u0_m0_wo1_mtree_mult1_8_reset <= areset;
    u0_m0_wo1_mtree_mult1_8_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 16,
        lpm_widthp => 28,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo1_mtree_mult1_8_a0,
        datab => u0_m0_wo1_mtree_mult1_8_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo1_mtree_mult1_8_reset,
        clock => clk,
        result => u0_m0_wo1_mtree_mult1_8_s1
    );
    u0_m0_wo1_mtree_mult1_8_q <= u0_m0_wo1_mtree_mult1_8_s1;

    -- u0_m0_wo1_mtree_add0_4(ADD,181)@12 + 1
    u0_m0_wo1_mtree_add0_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo1_mtree_mult1_8_q(27)) & u0_m0_wo1_mtree_mult1_8_q));
    u0_m0_wo1_mtree_add0_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 26 => u0_m0_wo1_mtree_mult1_9_sub_5_q(25)) & u0_m0_wo1_mtree_mult1_9_sub_5_q));
    u0_m0_wo1_mtree_add0_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_4_a) + SIGNED(u0_m0_wo1_mtree_add0_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_4_q <= u0_m0_wo1_mtree_add0_4_o(28 downto 0);

    -- u0_m0_wo1_mtree_add1_2(ADD,190)@13 + 1
    u0_m0_wo1_mtree_add1_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 29 => u0_m0_wo1_mtree_add0_4_q(28)) & u0_m0_wo1_mtree_add0_4_q));
    u0_m0_wo1_mtree_add1_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo1_mtree_add0_5_q(30)) & u0_m0_wo1_mtree_add0_5_q));
    u0_m0_wo1_mtree_add1_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add1_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add1_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add1_2_a) + SIGNED(u0_m0_wo1_mtree_add1_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add1_2_q <= u0_m0_wo1_mtree_add1_2_o(31 downto 0);

    -- u0_m0_wo1_mtree_add2_1(ADD,195)@14 + 1
    u0_m0_wo1_mtree_add2_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo1_mtree_add1_2_q(31)) & u0_m0_wo1_mtree_add1_2_q));
    u0_m0_wo1_mtree_add2_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 31 => u0_m0_wo1_mtree_add1_3_q(30)) & u0_m0_wo1_mtree_add1_3_q));
    u0_m0_wo1_mtree_add2_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add2_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add2_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add2_1_a) + SIGNED(u0_m0_wo1_mtree_add2_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add2_1_q <= u0_m0_wo1_mtree_add2_1_o(32 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr15_q_11(DELAY,1025)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr15_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr15_q, xout => d_u0_m0_wo0_wi0_r0_delayr15_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_mtree_mult1_7_shift2(BITSHIFT,500)@11
    u0_m0_wo1_mtree_mult1_7_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr15_q_11_q & "000000000";
    u0_m0_wo1_mtree_mult1_7_shift2_q <= u0_m0_wo1_mtree_mult1_7_shift2_qint(24 downto 0);

    -- u0_m0_wo1_mtree_mult1_7_shift0(BITSHIFT,498)@10
    u0_m0_wo1_mtree_mult1_7_shift0_qint <= u0_m0_wo0_wi0_r0_delayr15_q & "0";
    u0_m0_wo1_mtree_mult1_7_shift0_q <= u0_m0_wo1_mtree_mult1_7_shift0_qint(16 downto 0);

    -- u0_m0_wo1_mtree_mult1_7_add_1(ADD,499)@10 + 1
    u0_m0_wo1_mtree_mult1_7_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => u0_m0_wo0_wi0_r0_delayr15_q(15)) & u0_m0_wo0_wi0_r0_delayr15_q));
    u0_m0_wo1_mtree_mult1_7_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo1_mtree_mult1_7_shift0_q(16)) & u0_m0_wo1_mtree_mult1_7_shift0_q));
    u0_m0_wo1_mtree_mult1_7_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_7_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_7_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_7_add_1_a) + SIGNED(u0_m0_wo1_mtree_mult1_7_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_7_add_1_q <= u0_m0_wo1_mtree_mult1_7_add_1_o(17 downto 0);

    -- u0_m0_wo1_mtree_mult1_7_add_3(ADD,501)@11 + 1
    u0_m0_wo1_mtree_mult1_7_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 18 => u0_m0_wo1_mtree_mult1_7_add_1_q(17)) & u0_m0_wo1_mtree_mult1_7_add_1_q));
    u0_m0_wo1_mtree_mult1_7_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo1_mtree_mult1_7_shift2_q(24)) & u0_m0_wo1_mtree_mult1_7_shift2_q));
    u0_m0_wo1_mtree_mult1_7_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_7_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_7_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_7_add_3_a) + SIGNED(u0_m0_wo1_mtree_mult1_7_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_7_add_3_q <= u0_m0_wo1_mtree_mult1_7_add_3_o(25 downto 0);

    -- u0_m0_wo1_mtree_mult1_6_shift2(BITSHIFT,504)@10
    u0_m0_wo1_mtree_mult1_6_shift2_qint <= u0_m0_wo0_wi0_r0_delayr16_q & "000";
    u0_m0_wo1_mtree_mult1_6_shift2_q <= u0_m0_wo1_mtree_mult1_6_shift2_qint(18 downto 0);

    -- u0_m0_wo1_mtree_mult1_6_add_3(ADD,505)@10 + 1
    u0_m0_wo1_mtree_mult1_6_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => u0_m0_wo0_wi0_r0_delayr16_q(15)) & u0_m0_wo0_wi0_r0_delayr16_q));
    u0_m0_wo1_mtree_mult1_6_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo1_mtree_mult1_6_shift2_q(18)) & u0_m0_wo1_mtree_mult1_6_shift2_q));
    u0_m0_wo1_mtree_mult1_6_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_6_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_6_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_6_add_3_a) + SIGNED(u0_m0_wo1_mtree_mult1_6_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_6_add_3_q <= u0_m0_wo1_mtree_mult1_6_add_3_o(19 downto 0);

    -- u0_m0_wo1_mtree_mult1_6_shift4(BITSHIFT,506)@11
    u0_m0_wo1_mtree_mult1_6_shift4_qint <= u0_m0_wo1_mtree_mult1_6_add_3_q & "00000";
    u0_m0_wo1_mtree_mult1_6_shift4_q <= u0_m0_wo1_mtree_mult1_6_shift4_qint(24 downto 0);

    -- u0_m0_wo1_mtree_mult1_6_shift0(BITSHIFT,502)@10
    u0_m0_wo1_mtree_mult1_6_shift0_qint <= u0_m0_wo0_wi0_r0_delayr16_q & "000";
    u0_m0_wo1_mtree_mult1_6_shift0_q <= u0_m0_wo1_mtree_mult1_6_shift0_qint(18 downto 0);

    -- u0_m0_wo1_mtree_mult1_6_sub_1(SUB,503)@10 + 1
    u0_m0_wo1_mtree_mult1_6_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo1_mtree_mult1_6_shift0_q(18)) & u0_m0_wo1_mtree_mult1_6_shift0_q));
    u0_m0_wo1_mtree_mult1_6_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => u0_m0_wo0_wi0_r0_delayr16_q(15)) & u0_m0_wo0_wi0_r0_delayr16_q));
    u0_m0_wo1_mtree_mult1_6_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_6_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_6_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_6_sub_1_a) - SIGNED(u0_m0_wo1_mtree_mult1_6_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_6_sub_1_q <= u0_m0_wo1_mtree_mult1_6_sub_1_o(19 downto 0);

    -- u0_m0_wo1_mtree_mult1_6_add_5(ADD,507)@11 + 1
    u0_m0_wo1_mtree_mult1_6_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 20 => u0_m0_wo1_mtree_mult1_6_sub_1_q(19)) & u0_m0_wo1_mtree_mult1_6_sub_1_q));
    u0_m0_wo1_mtree_mult1_6_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo1_mtree_mult1_6_shift4_q(24)) & u0_m0_wo1_mtree_mult1_6_shift4_q));
    u0_m0_wo1_mtree_mult1_6_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_6_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_6_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_6_add_5_a) + SIGNED(u0_m0_wo1_mtree_mult1_6_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_6_add_5_q <= u0_m0_wo1_mtree_mult1_6_add_5_o(25 downto 0);

    -- u0_m0_wo1_mtree_mult1_6_shift6(BITSHIFT,508)@12
    u0_m0_wo1_mtree_mult1_6_shift6_qint <= u0_m0_wo1_mtree_mult1_6_add_5_q & "0";
    u0_m0_wo1_mtree_mult1_6_shift6_q <= u0_m0_wo1_mtree_mult1_6_shift6_qint(26 downto 0);

    -- u0_m0_wo1_mtree_add0_3(ADD,180)@12 + 1
    u0_m0_wo1_mtree_add0_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo1_mtree_mult1_6_shift6_q(26)) & u0_m0_wo1_mtree_mult1_6_shift6_q));
    u0_m0_wo1_mtree_add0_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 26 => u0_m0_wo1_mtree_mult1_7_add_3_q(25)) & u0_m0_wo1_mtree_mult1_7_add_3_q));
    u0_m0_wo1_mtree_add0_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_3_a) + SIGNED(u0_m0_wo1_mtree_add0_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_3_q <= u0_m0_wo1_mtree_add0_3_o(27 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr17_q_11(DELAY,1027)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr17_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr17_q, xout => d_u0_m0_wo0_wi0_r0_delayr17_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_mtree_mult1_5_shift2(BITSHIFT,511)@11
    u0_m0_wo1_mtree_mult1_5_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr17_q_11_q & "000000000";
    u0_m0_wo1_mtree_mult1_5_shift2_q <= u0_m0_wo1_mtree_mult1_5_shift2_qint(24 downto 0);

    -- u0_m0_wo1_mtree_mult1_5_shift0(BITSHIFT,509)@10
    u0_m0_wo1_mtree_mult1_5_shift0_qint <= u0_m0_wo0_wi0_r0_delayr17_q & "000000";
    u0_m0_wo1_mtree_mult1_5_shift0_q <= u0_m0_wo1_mtree_mult1_5_shift0_qint(21 downto 0);

    -- u0_m0_wo1_mtree_mult1_5_add_1(ADD,510)@10 + 1
    u0_m0_wo1_mtree_mult1_5_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 16 => u0_m0_wo0_wi0_r0_delayr17_q(15)) & u0_m0_wo0_wi0_r0_delayr17_q));
    u0_m0_wo1_mtree_mult1_5_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo1_mtree_mult1_5_shift0_q(21)) & u0_m0_wo1_mtree_mult1_5_shift0_q));
    u0_m0_wo1_mtree_mult1_5_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_5_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_5_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_5_add_1_a) + SIGNED(u0_m0_wo1_mtree_mult1_5_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_5_add_1_q <= u0_m0_wo1_mtree_mult1_5_add_1_o(22 downto 0);

    -- u0_m0_wo1_mtree_mult1_5_sub_3(SUB,512)@11 + 1
    u0_m0_wo1_mtree_mult1_5_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 23 => u0_m0_wo1_mtree_mult1_5_add_1_q(22)) & u0_m0_wo1_mtree_mult1_5_add_1_q));
    u0_m0_wo1_mtree_mult1_5_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo1_mtree_mult1_5_shift2_q(24)) & u0_m0_wo1_mtree_mult1_5_shift2_q));
    u0_m0_wo1_mtree_mult1_5_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_5_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_5_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_5_sub_3_a) - SIGNED(u0_m0_wo1_mtree_mult1_5_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_5_sub_3_q <= u0_m0_wo1_mtree_mult1_5_sub_3_o(25 downto 0);

    -- u0_m0_wo1_mtree_mult1_4_shift2(BITSHIFT,515)@11
    u0_m0_wo1_mtree_mult1_4_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr18_q_11_q & "00000000";
    u0_m0_wo1_mtree_mult1_4_shift2_q <= u0_m0_wo1_mtree_mult1_4_shift2_qint(23 downto 0);

    -- u0_m0_wo1_mtree_mult1_4_shift0(BITSHIFT,513)@10
    u0_m0_wo1_mtree_mult1_4_shift0_qint <= u0_m0_wo0_wi0_r0_delayr18_q & "000000";
    u0_m0_wo1_mtree_mult1_4_shift0_q <= u0_m0_wo1_mtree_mult1_4_shift0_qint(21 downto 0);

    -- u0_m0_wo1_mtree_mult1_4_sub_1(SUB,514)@10 + 1
    u0_m0_wo1_mtree_mult1_4_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo1_mtree_mult1_4_shift0_q(21)) & u0_m0_wo1_mtree_mult1_4_shift0_q));
    u0_m0_wo1_mtree_mult1_4_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 16 => u0_m0_wo0_wi0_r0_delayr18_q(15)) & u0_m0_wo0_wi0_r0_delayr18_q));
    u0_m0_wo1_mtree_mult1_4_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_4_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_4_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_4_sub_1_a) - SIGNED(u0_m0_wo1_mtree_mult1_4_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_4_sub_1_q <= u0_m0_wo1_mtree_mult1_4_sub_1_o(22 downto 0);

    -- u0_m0_wo1_mtree_mult1_4_sub_3(SUB,516)@11 + 1
    u0_m0_wo1_mtree_mult1_4_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => u0_m0_wo1_mtree_mult1_4_sub_1_q(22)) & u0_m0_wo1_mtree_mult1_4_sub_1_q));
    u0_m0_wo1_mtree_mult1_4_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo1_mtree_mult1_4_shift2_q(23)) & u0_m0_wo1_mtree_mult1_4_shift2_q));
    u0_m0_wo1_mtree_mult1_4_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_4_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_4_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_4_sub_3_a) - SIGNED(u0_m0_wo1_mtree_mult1_4_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_4_sub_3_q <= u0_m0_wo1_mtree_mult1_4_sub_3_o(24 downto 0);

    -- u0_m0_wo1_mtree_add0_2(ADD,179)@12 + 1
    u0_m0_wo1_mtree_add0_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => u0_m0_wo1_mtree_mult1_4_sub_3_q(24)) & u0_m0_wo1_mtree_mult1_4_sub_3_q));
    u0_m0_wo1_mtree_add0_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo1_mtree_mult1_5_sub_3_q(25)) & u0_m0_wo1_mtree_mult1_5_sub_3_q));
    u0_m0_wo1_mtree_add0_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_2_a) + SIGNED(u0_m0_wo1_mtree_add0_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_2_q <= u0_m0_wo1_mtree_add0_2_o(26 downto 0);

    -- u0_m0_wo1_mtree_add1_1(ADD,189)@13 + 1
    u0_m0_wo1_mtree_add1_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 27 => u0_m0_wo1_mtree_add0_2_q(26)) & u0_m0_wo1_mtree_add0_2_q));
    u0_m0_wo1_mtree_add1_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo1_mtree_add0_3_q(27)) & u0_m0_wo1_mtree_add0_3_q));
    u0_m0_wo1_mtree_add1_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add1_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add1_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add1_1_a) + SIGNED(u0_m0_wo1_mtree_add1_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add1_1_q <= u0_m0_wo1_mtree_add1_1_o(28 downto 0);

    -- u0_m0_wo1_mtree_mult1_3_shift2(BITSHIFT,519)@10
    u0_m0_wo1_mtree_mult1_3_shift2_qint <= u0_m0_wo0_wi0_r0_delayr19_q & "000";
    u0_m0_wo1_mtree_mult1_3_shift2_q <= u0_m0_wo1_mtree_mult1_3_shift2_qint(18 downto 0);

    -- u0_m0_wo1_mtree_mult1_3_sub_3(SUB,520)@10 + 1
    u0_m0_wo1_mtree_mult1_3_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo1_mtree_mult1_3_shift2_q(18)) & u0_m0_wo1_mtree_mult1_3_shift2_q));
    u0_m0_wo1_mtree_mult1_3_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => u0_m0_wo0_wi0_r0_delayr19_q(15)) & u0_m0_wo0_wi0_r0_delayr19_q));
    u0_m0_wo1_mtree_mult1_3_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_3_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_3_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_3_sub_3_a) - SIGNED(u0_m0_wo1_mtree_mult1_3_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_3_sub_3_q <= u0_m0_wo1_mtree_mult1_3_sub_3_o(19 downto 0);

    -- u0_m0_wo1_mtree_mult1_3_shift4(BITSHIFT,521)@11
    u0_m0_wo1_mtree_mult1_3_shift4_qint <= u0_m0_wo1_mtree_mult1_3_sub_3_q & "0000";
    u0_m0_wo1_mtree_mult1_3_shift4_q <= u0_m0_wo1_mtree_mult1_3_shift4_qint(23 downto 0);

    -- u0_m0_wo1_mtree_mult1_3_shift0(BITSHIFT,517)@10
    u0_m0_wo1_mtree_mult1_3_shift0_qint <= u0_m0_wo0_wi0_r0_delayr19_q & "00";
    u0_m0_wo1_mtree_mult1_3_shift0_q <= u0_m0_wo1_mtree_mult1_3_shift0_qint(17 downto 0);

    -- u0_m0_wo1_mtree_mult1_3_sub_1(SUB,518)@10 + 1
    u0_m0_wo1_mtree_mult1_3_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo1_mtree_mult1_3_shift0_q(17)) & u0_m0_wo1_mtree_mult1_3_shift0_q));
    u0_m0_wo1_mtree_mult1_3_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo0_wi0_r0_delayr19_q(15)) & u0_m0_wo0_wi0_r0_delayr19_q));
    u0_m0_wo1_mtree_mult1_3_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_3_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_3_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_3_sub_1_a) - SIGNED(u0_m0_wo1_mtree_mult1_3_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_3_sub_1_q <= u0_m0_wo1_mtree_mult1_3_sub_1_o(18 downto 0);

    -- u0_m0_wo1_mtree_mult1_3_add_5(ADD,522)@11 + 1
    u0_m0_wo1_mtree_mult1_3_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 19 => u0_m0_wo1_mtree_mult1_3_sub_1_q(18)) & u0_m0_wo1_mtree_mult1_3_sub_1_q));
    u0_m0_wo1_mtree_mult1_3_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo1_mtree_mult1_3_shift4_q(23)) & u0_m0_wo1_mtree_mult1_3_shift4_q));
    u0_m0_wo1_mtree_mult1_3_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_3_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_3_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_3_add_5_a) + SIGNED(u0_m0_wo1_mtree_mult1_3_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_3_add_5_q <= u0_m0_wo1_mtree_mult1_3_add_5_o(24 downto 0);

    -- u0_m0_wo1_mtree_mult1_3_shift6(BITSHIFT,523)@12
    u0_m0_wo1_mtree_mult1_3_shift6_qint <= u0_m0_wo1_mtree_mult1_3_add_5_q & "00";
    u0_m0_wo1_mtree_mult1_3_shift6_q <= u0_m0_wo1_mtree_mult1_3_shift6_qint(26 downto 0);

    -- u0_m0_wo1_mtree_mult1_2(MULT,174)@10 + 2
    u0_m0_wo1_mtree_mult1_2_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm20_q);
    u0_m0_wo1_mtree_mult1_2_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr20_q);
    u0_m0_wo1_mtree_mult1_2_reset <= areset;
    u0_m0_wo1_mtree_mult1_2_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 10,
        lpm_widthb => 16,
        lpm_widthp => 26,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo1_mtree_mult1_2_a0,
        datab => u0_m0_wo1_mtree_mult1_2_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo1_mtree_mult1_2_reset,
        clock => clk,
        result => u0_m0_wo1_mtree_mult1_2_s1
    );
    u0_m0_wo1_mtree_mult1_2_q <= u0_m0_wo1_mtree_mult1_2_s1;

    -- u0_m0_wo1_mtree_add0_1(ADD,178)@12 + 1
    u0_m0_wo1_mtree_add0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo1_mtree_mult1_2_q(25)) & u0_m0_wo1_mtree_mult1_2_q));
    u0_m0_wo1_mtree_add0_1_b <= STD_LOGIC_VECTOR(u0_m0_wo1_mtree_mult1_3_shift6_q);
    u0_m0_wo1_mtree_add0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_1_a) + SIGNED(u0_m0_wo1_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_1_q <= u0_m0_wo1_mtree_add0_1_o(26 downto 0);

    -- u0_m0_wo1_mtree_mult1_1_shift0(BITSHIFT,533)@11
    u0_m0_wo1_mtree_mult1_1_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr21_q_11_q & "00";
    u0_m0_wo1_mtree_mult1_1_shift0_q <= u0_m0_wo1_mtree_mult1_1_shift0_qint(17 downto 0);

    -- u0_m0_wo1_mtree_mult1_1_add_1(ADD,534)@11 + 1
    u0_m0_wo1_mtree_mult1_1_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => d_u0_m0_wo0_wi0_r0_delayr21_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr21_q_11_q));
    u0_m0_wo1_mtree_mult1_1_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo1_mtree_mult1_1_shift0_q(17)) & u0_m0_wo1_mtree_mult1_1_shift0_q));
    u0_m0_wo1_mtree_mult1_1_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_1_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_1_add_1_a) + SIGNED(u0_m0_wo1_mtree_mult1_1_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_1_add_1_q <= u0_m0_wo1_mtree_mult1_1_add_1_o(18 downto 0);

    -- u0_m0_wo1_mtree_mult1_1_shift2(BITSHIFT,535)@12
    u0_m0_wo1_mtree_mult1_1_shift2_qint <= u0_m0_wo1_mtree_mult1_1_add_1_q & "00";
    u0_m0_wo1_mtree_mult1_1_shift2_q <= u0_m0_wo1_mtree_mult1_1_shift2_qint(20 downto 0);

    -- u0_m0_wo1_mtree_mult1_0_shift1(BITSHIFT,537)@11
    u0_m0_wo1_mtree_mult1_0_shift1_qint <= d_u0_m0_wo0_wi0_r0_delayr22_q_11_q & "00000";
    u0_m0_wo1_mtree_mult1_0_shift1_q <= u0_m0_wo1_mtree_mult1_0_shift1_qint(20 downto 0);

    -- u0_m0_wo1_mtree_mult1_0_sub_0(SUB,536)@10 + 1
    u0_m0_wo1_mtree_mult1_0_sub_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 1 => GND_q(0)) & GND_q));
    u0_m0_wo1_mtree_mult1_0_sub_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr22_q(15)) & u0_m0_wo0_wi0_r0_delayr22_q));
    u0_m0_wo1_mtree_mult1_0_sub_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_0_sub_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_0_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_0_sub_0_a) - SIGNED(u0_m0_wo1_mtree_mult1_0_sub_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_0_sub_0_q <= u0_m0_wo1_mtree_mult1_0_sub_0_o(16 downto 0);

    -- u0_m0_wo1_mtree_mult1_0_sub_2(SUB,538)@11 + 1
    u0_m0_wo1_mtree_mult1_0_sub_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 17 => u0_m0_wo1_mtree_mult1_0_sub_0_q(16)) & u0_m0_wo1_mtree_mult1_0_sub_0_q));
    u0_m0_wo1_mtree_mult1_0_sub_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo1_mtree_mult1_0_shift1_q(20)) & u0_m0_wo1_mtree_mult1_0_shift1_q));
    u0_m0_wo1_mtree_mult1_0_sub_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_0_sub_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_0_sub_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_0_sub_2_a) - SIGNED(u0_m0_wo1_mtree_mult1_0_sub_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_0_sub_2_q <= u0_m0_wo1_mtree_mult1_0_sub_2_o(21 downto 0);

    -- u0_m0_wo1_mtree_add0_0(ADD,177)@12 + 1
    u0_m0_wo1_mtree_add0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo1_mtree_mult1_0_sub_2_q(21)) & u0_m0_wo1_mtree_mult1_0_sub_2_q));
    u0_m0_wo1_mtree_add0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 21 => u0_m0_wo1_mtree_mult1_1_shift2_q(20)) & u0_m0_wo1_mtree_mult1_1_shift2_q));
    u0_m0_wo1_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_0_a) + SIGNED(u0_m0_wo1_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_0_q <= u0_m0_wo1_mtree_add0_0_o(22 downto 0);

    -- u0_m0_wo1_mtree_add1_0(ADD,188)@13 + 1
    u0_m0_wo1_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 23 => u0_m0_wo1_mtree_add0_0_q(22)) & u0_m0_wo1_mtree_add0_0_q));
    u0_m0_wo1_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo1_mtree_add0_1_q(26)) & u0_m0_wo1_mtree_add0_1_q));
    u0_m0_wo1_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add1_0_a) + SIGNED(u0_m0_wo1_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add1_0_q <= u0_m0_wo1_mtree_add1_0_o(27 downto 0);

    -- u0_m0_wo1_mtree_add2_0(ADD,194)@14 + 1
    u0_m0_wo1_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 28 => u0_m0_wo1_mtree_add1_0_q(27)) & u0_m0_wo1_mtree_add1_0_q));
    u0_m0_wo1_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo1_mtree_add1_1_q(28)) & u0_m0_wo1_mtree_add1_1_q));
    u0_m0_wo1_mtree_add2_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add2_0_a) + SIGNED(u0_m0_wo1_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add2_0_q <= u0_m0_wo1_mtree_add2_0_o(29 downto 0);

    -- u0_m0_wo1_mtree_add3_0(ADD,197)@15 + 1
    u0_m0_wo1_mtree_add3_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 30 => u0_m0_wo1_mtree_add2_0_q(29)) & u0_m0_wo1_mtree_add2_0_q));
    u0_m0_wo1_mtree_add3_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo1_mtree_add2_1_q(32)) & u0_m0_wo1_mtree_add2_1_q));
    u0_m0_wo1_mtree_add3_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add3_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add3_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add3_0_a) + SIGNED(u0_m0_wo1_mtree_add3_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add3_0_q <= u0_m0_wo1_mtree_add3_0_o(33 downto 0);

    -- u0_m0_wo1_mtree_add4_0(ADD,198)@16 + 1
    u0_m0_wo1_mtree_add4_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 34 => u0_m0_wo1_mtree_add3_0_q(33)) & u0_m0_wo1_mtree_add3_0_q));
    u0_m0_wo1_mtree_add4_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 30 => u0_m0_wo1_mtree_add2_2_q(29)) & u0_m0_wo1_mtree_add2_2_q));
    u0_m0_wo1_mtree_add4_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add4_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add4_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add4_0_a) + SIGNED(u0_m0_wo1_mtree_add4_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add4_0_q <= u0_m0_wo1_mtree_add4_0_o(34 downto 0);

    -- d_u0_m0_wo0_memread_q_11(DELAY,1006)@10 + 1
    d_u0_m0_wo0_memread_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_memread_q_11_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_11(DELAY,1007)@10 + 1
    d_u0_m0_wo0_compute_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_compute_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr23(DELAY,42)@11
    u0_m0_wo0_wi0_r0_delayr23 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr22_q_11_q, xout => u0_m0_wo0_wi0_r0_delayr23_q, ena => d_u0_m0_wo0_compute_q_11_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_sym_add0(ADD,58)@11 + 1
    u0_m0_wo0_sym_add0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => d_u0_m0_wo0_wi0_r0_phasedelay0_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_phasedelay0_q_11_q));
    u0_m0_wo0_sym_add0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr23_q(15)) & u0_m0_wo0_wi0_r0_delayr23_q));
    u0_m0_wo0_sym_add0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add0_a) + SIGNED(u0_m0_wo0_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add0_q <= u0_m0_wo0_sym_add0_o(16 downto 0);

    -- d_u0_m0_wo0_sym_add0_q_13(DELAY,1033)@12 + 1
    d_u0_m0_wo0_sym_add0_q_13 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_sym_add0_q, xout => d_u0_m0_wo0_sym_add0_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_11_shift2(BITSHIFT,321)@13
    u0_m0_wo0_mtree_mult1_11_shift2_qint <= d_u0_m0_wo0_sym_add0_q_13_q & "000";
    u0_m0_wo0_mtree_mult1_11_shift2_q <= u0_m0_wo0_mtree_mult1_11_shift2_qint(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_11_shift0(BITSHIFT,319)@12
    u0_m0_wo0_mtree_mult1_11_shift0_qint <= u0_m0_wo0_sym_add0_q & "0";
    u0_m0_wo0_mtree_mult1_11_shift0_q <= u0_m0_wo0_mtree_mult1_11_shift0_qint(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_11_sub_1(SUB,320)@12 + 1
    u0_m0_wo0_mtree_mult1_11_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 1 => GND_q(0)) & GND_q));
    u0_m0_wo0_mtree_mult1_11_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_11_shift0_q(17)) & u0_m0_wo0_mtree_mult1_11_shift0_q));
    u0_m0_wo0_mtree_mult1_11_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_11_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_11_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_11_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_11_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_11_sub_1_q <= u0_m0_wo0_mtree_mult1_11_sub_1_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_11_sub_3(SUB,322)@13 + 1
    u0_m0_wo0_mtree_mult1_11_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => u0_m0_wo0_mtree_mult1_11_sub_1_q(18)) & u0_m0_wo0_mtree_mult1_11_sub_1_q));
    u0_m0_wo0_mtree_mult1_11_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_11_shift2_q(19)) & u0_m0_wo0_mtree_mult1_11_shift2_q));
    u0_m0_wo0_mtree_mult1_11_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_11_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_11_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_11_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_11_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_11_sub_3_q <= u0_m0_wo0_mtree_mult1_11_sub_3_o(20 downto 0);

    -- u0_m0_wo0_sym_add1(ADD,59)@11 + 1
    u0_m0_wo0_sym_add1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => d_u0_m0_wo0_wi0_r0_delayr1_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr1_q_11_q));
    u0_m0_wo0_sym_add1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => d_u0_m0_wo0_wi0_r0_delayr22_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr22_q_11_q));
    u0_m0_wo0_sym_add1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add1_a) + SIGNED(u0_m0_wo0_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add1_q <= u0_m0_wo0_sym_add1_o(16 downto 0);

    -- d_u0_m0_wo0_sym_add1_q_13(DELAY,1034)@12 + 1
    d_u0_m0_wo0_sym_add1_q_13 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_sym_add1_q, xout => d_u0_m0_wo0_sym_add1_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_10_shift2(BITSHIFT,325)@13
    u0_m0_wo0_mtree_mult1_10_shift2_qint <= d_u0_m0_wo0_sym_add1_q_13_q & "0000";
    u0_m0_wo0_mtree_mult1_10_shift2_q <= u0_m0_wo0_mtree_mult1_10_shift2_qint(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_10_shift0(BITSHIFT,323)@12
    u0_m0_wo0_mtree_mult1_10_shift0_qint <= u0_m0_wo0_sym_add1_q & "00";
    u0_m0_wo0_mtree_mult1_10_shift0_q <= u0_m0_wo0_mtree_mult1_10_shift0_qint(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_10_sub_1(SUB,324)@12 + 1
    u0_m0_wo0_mtree_mult1_10_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 17 => u0_m0_wo0_sym_add1_q(16)) & u0_m0_wo0_sym_add1_q));
    u0_m0_wo0_mtree_mult1_10_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_10_shift0_q(18)) & u0_m0_wo0_mtree_mult1_10_shift0_q));
    u0_m0_wo0_mtree_mult1_10_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_10_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_10_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_10_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_10_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_10_sub_1_q <= u0_m0_wo0_mtree_mult1_10_sub_1_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_10_sub_3(SUB,326)@13 + 1
    u0_m0_wo0_mtree_mult1_10_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => u0_m0_wo0_mtree_mult1_10_sub_1_q(19)) & u0_m0_wo0_mtree_mult1_10_sub_1_q));
    u0_m0_wo0_mtree_mult1_10_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo0_mtree_mult1_10_shift2_q(20)) & u0_m0_wo0_mtree_mult1_10_shift2_q));
    u0_m0_wo0_mtree_mult1_10_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_10_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_10_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_10_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_10_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_10_sub_3_q <= u0_m0_wo0_mtree_mult1_10_sub_3_o(21 downto 0);

    -- u0_m0_wo0_mtree_mult1_10_shift4(BITSHIFT,327)@14
    u0_m0_wo0_mtree_mult1_10_shift4_qint <= u0_m0_wo0_mtree_mult1_10_sub_3_q & "0";
    u0_m0_wo0_mtree_mult1_10_shift4_q <= u0_m0_wo0_mtree_mult1_10_shift4_qint(22 downto 0);

    -- u0_m0_wo0_mtree_add0_5(ADD,87)@14 + 1
    u0_m0_wo0_mtree_add0_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_mult1_10_shift4_q(22)) & u0_m0_wo0_mtree_mult1_10_shift4_q));
    u0_m0_wo0_mtree_add0_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 21 => u0_m0_wo0_mtree_mult1_11_sub_3_q(20)) & u0_m0_wo0_mtree_mult1_11_sub_3_q));
    u0_m0_wo0_mtree_add0_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_5_a) + SIGNED(u0_m0_wo0_mtree_add0_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_5_q <= u0_m0_wo0_mtree_add0_5_o(23 downto 0);

    -- u0_m0_wo0_sym_add2(ADD,60)@11 + 1
    u0_m0_wo0_sym_add2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => d_u0_m0_wo0_wi0_r0_delayr2_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr2_q_11_q));
    u0_m0_wo0_sym_add2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => d_u0_m0_wo0_wi0_r0_delayr21_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr21_q_11_q));
    u0_m0_wo0_sym_add2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add2_a) + SIGNED(u0_m0_wo0_sym_add2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add2_q <= u0_m0_wo0_sym_add2_o(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_9_shift2(BITSHIFT,330)@12
    u0_m0_wo0_mtree_mult1_9_shift2_qint <= u0_m0_wo0_sym_add2_q & "00";
    u0_m0_wo0_mtree_mult1_9_shift2_q <= u0_m0_wo0_mtree_mult1_9_shift2_qint(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_9_sub_3(SUB,331)@12 + 1
    u0_m0_wo0_mtree_mult1_9_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_9_shift2_q(18)) & u0_m0_wo0_mtree_mult1_9_shift2_q));
    u0_m0_wo0_mtree_mult1_9_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 17 => u0_m0_wo0_sym_add2_q(16)) & u0_m0_wo0_sym_add2_q));
    u0_m0_wo0_mtree_mult1_9_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_9_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_9_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_9_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_9_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_9_sub_3_q <= u0_m0_wo0_mtree_mult1_9_sub_3_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_9_shift4(BITSHIFT,332)@13
    u0_m0_wo0_mtree_mult1_9_shift4_qint <= u0_m0_wo0_mtree_mult1_9_sub_3_q & "00000";
    u0_m0_wo0_mtree_mult1_9_shift4_q <= u0_m0_wo0_mtree_mult1_9_shift4_qint(24 downto 0);

    -- u0_m0_wo0_mtree_mult1_9_shift0(BITSHIFT,328)@12
    u0_m0_wo0_mtree_mult1_9_shift0_qint <= u0_m0_wo0_sym_add2_q & "000";
    u0_m0_wo0_mtree_mult1_9_shift0_q <= u0_m0_wo0_mtree_mult1_9_shift0_qint(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_9_sub_1(SUB,329)@12 + 1
    u0_m0_wo0_mtree_mult1_9_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_9_shift0_q(19)) & u0_m0_wo0_mtree_mult1_9_shift0_q));
    u0_m0_wo0_mtree_mult1_9_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 17 => u0_m0_wo0_sym_add2_q(16)) & u0_m0_wo0_sym_add2_q));
    u0_m0_wo0_mtree_mult1_9_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_9_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_9_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_9_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_9_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_9_sub_1_q <= u0_m0_wo0_mtree_mult1_9_sub_1_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_9_add_5(ADD,333)@13 + 1
    u0_m0_wo0_mtree_mult1_9_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 21 => u0_m0_wo0_mtree_mult1_9_sub_1_q(20)) & u0_m0_wo0_mtree_mult1_9_sub_1_q));
    u0_m0_wo0_mtree_mult1_9_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_9_shift4_q(24)) & u0_m0_wo0_mtree_mult1_9_shift4_q));
    u0_m0_wo0_mtree_mult1_9_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_9_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_9_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_9_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_9_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_9_add_5_q <= u0_m0_wo0_mtree_mult1_9_add_5_o(25 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr20_q_11(DELAY,1030)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr20_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr20_q, xout => d_u0_m0_wo0_wi0_r0_delayr20_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_sym_add3(ADD,61)@11 + 1
    u0_m0_wo0_sym_add3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => d_u0_m0_wo0_wi0_r0_delayr3_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr3_q_11_q));
    u0_m0_wo0_sym_add3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => d_u0_m0_wo0_wi0_r0_delayr20_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr20_q_11_q));
    u0_m0_wo0_sym_add3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add3_a) + SIGNED(u0_m0_wo0_sym_add3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add3_q <= u0_m0_wo0_sym_add3_o(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_8_shift2(BITSHIFT,336)@12
    u0_m0_wo0_mtree_mult1_8_shift2_qint <= u0_m0_wo0_sym_add3_q & "000";
    u0_m0_wo0_mtree_mult1_8_shift2_q <= u0_m0_wo0_mtree_mult1_8_shift2_qint(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_8_sub_3(SUB,337)@12 + 1
    u0_m0_wo0_mtree_mult1_8_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_8_shift2_q(19)) & u0_m0_wo0_mtree_mult1_8_shift2_q));
    u0_m0_wo0_mtree_mult1_8_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 17 => u0_m0_wo0_sym_add3_q(16)) & u0_m0_wo0_sym_add3_q));
    u0_m0_wo0_mtree_mult1_8_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_8_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_8_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_8_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_8_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_8_sub_3_q <= u0_m0_wo0_mtree_mult1_8_sub_3_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_8_shift4(BITSHIFT,338)@13
    u0_m0_wo0_mtree_mult1_8_shift4_qint <= u0_m0_wo0_mtree_mult1_8_sub_3_q & "00000";
    u0_m0_wo0_mtree_mult1_8_shift4_q <= u0_m0_wo0_mtree_mult1_8_shift4_qint(25 downto 0);

    -- u0_m0_wo0_mtree_mult1_8_shift0(BITSHIFT,334)@12
    u0_m0_wo0_mtree_mult1_8_shift0_qint <= u0_m0_wo0_sym_add3_q & "00";
    u0_m0_wo0_mtree_mult1_8_shift0_q <= u0_m0_wo0_mtree_mult1_8_shift0_qint(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_8_sub_1(SUB,335)@12 + 1
    u0_m0_wo0_mtree_mult1_8_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_8_shift0_q(18)) & u0_m0_wo0_mtree_mult1_8_shift0_q));
    u0_m0_wo0_mtree_mult1_8_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 17 => u0_m0_wo0_sym_add3_q(16)) & u0_m0_wo0_sym_add3_q));
    u0_m0_wo0_mtree_mult1_8_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_8_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_8_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_8_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_8_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_8_sub_1_q <= u0_m0_wo0_mtree_mult1_8_sub_1_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_8_add_5(ADD,339)@13 + 1
    u0_m0_wo0_mtree_mult1_8_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 20 => u0_m0_wo0_mtree_mult1_8_sub_1_q(19)) & u0_m0_wo0_mtree_mult1_8_sub_1_q));
    u0_m0_wo0_mtree_mult1_8_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_mult1_8_shift4_q(25)) & u0_m0_wo0_mtree_mult1_8_shift4_q));
    u0_m0_wo0_mtree_mult1_8_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_8_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_8_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_8_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_8_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_8_add_5_q <= u0_m0_wo0_mtree_mult1_8_add_5_o(26 downto 0);

    -- u0_m0_wo0_mtree_mult1_8_shift6(BITSHIFT,340)@14
    u0_m0_wo0_mtree_mult1_8_shift6_qint <= u0_m0_wo0_mtree_mult1_8_add_5_q & "0";
    u0_m0_wo0_mtree_mult1_8_shift6_q <= u0_m0_wo0_mtree_mult1_8_shift6_qint(27 downto 0);

    -- u0_m0_wo0_mtree_add0_4(ADD,86)@14 + 1
    u0_m0_wo0_mtree_add0_4_a <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_8_shift6_q);
    u0_m0_wo0_mtree_add0_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 26 => u0_m0_wo0_mtree_mult1_9_add_5_q(25)) & u0_m0_wo0_mtree_mult1_9_add_5_q));
    u0_m0_wo0_mtree_add0_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_4_a) + SIGNED(u0_m0_wo0_mtree_add0_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_4_q <= u0_m0_wo0_mtree_add0_4_o(27 downto 0);

    -- u0_m0_wo0_mtree_add1_2(ADD,90)@15 + 1
    u0_m0_wo0_mtree_add1_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_add0_4_q(27)) & u0_m0_wo0_mtree_add0_4_q));
    u0_m0_wo0_mtree_add1_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 24 => u0_m0_wo0_mtree_add0_5_q(23)) & u0_m0_wo0_mtree_add0_5_q));
    u0_m0_wo0_mtree_add1_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_2_a) + SIGNED(u0_m0_wo0_mtree_add1_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_2_q <= u0_m0_wo0_mtree_add1_2_o(28 downto 0);

    -- u0_m0_wo0_sym_add4(ADD,62)@10 + 1
    u0_m0_wo0_sym_add4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr4_q(15)) & u0_m0_wo0_wi0_r0_delayr4_q));
    u0_m0_wo0_sym_add4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr19_q(15)) & u0_m0_wo0_wi0_r0_delayr19_q));
    u0_m0_wo0_sym_add4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add4_a) + SIGNED(u0_m0_wo0_sym_add4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add4_q <= u0_m0_wo0_sym_add4_o(16 downto 0);

    -- d_u0_m0_wo0_sym_add4_q_12(DELAY,1035)@11 + 1
    d_u0_m0_wo0_sym_add4_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_sym_add4_q, xout => d_u0_m0_wo0_sym_add4_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_7_shift2(BITSHIFT,343)@12
    u0_m0_wo0_mtree_mult1_7_shift2_qint <= d_u0_m0_wo0_sym_add4_q_12_q & "00000";
    u0_m0_wo0_mtree_mult1_7_shift2_q <= u0_m0_wo0_mtree_mult1_7_shift2_qint(21 downto 0);

    -- u0_m0_wo0_mtree_mult1_7_shift0(BITSHIFT,341)@11
    u0_m0_wo0_mtree_mult1_7_shift0_qint <= u0_m0_wo0_sym_add4_q & "000";
    u0_m0_wo0_mtree_mult1_7_shift0_q <= u0_m0_wo0_mtree_mult1_7_shift0_qint(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_7_sub_1(SUB,342)@11 + 1
    u0_m0_wo0_mtree_mult1_7_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_7_shift0_q(19)) & u0_m0_wo0_mtree_mult1_7_shift0_q));
    u0_m0_wo0_mtree_mult1_7_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 17 => u0_m0_wo0_sym_add4_q(16)) & u0_m0_wo0_sym_add4_q));
    u0_m0_wo0_mtree_mult1_7_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_7_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_7_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_7_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_7_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_7_sub_1_q <= u0_m0_wo0_mtree_mult1_7_sub_1_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_7_add_3(ADD,344)@12 + 1
    u0_m0_wo0_mtree_mult1_7_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 21 => u0_m0_wo0_mtree_mult1_7_sub_1_q(20)) & u0_m0_wo0_mtree_mult1_7_sub_1_q));
    u0_m0_wo0_mtree_mult1_7_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo0_mtree_mult1_7_shift2_q(21)) & u0_m0_wo0_mtree_mult1_7_shift2_q));
    u0_m0_wo0_mtree_mult1_7_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_7_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_7_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_7_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_7_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_7_add_3_q <= u0_m0_wo0_mtree_mult1_7_add_3_o(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_7_shift4(BITSHIFT,345)@13
    u0_m0_wo0_mtree_mult1_7_shift4_qint <= u0_m0_wo0_mtree_mult1_7_add_3_q & "000";
    u0_m0_wo0_mtree_mult1_7_shift4_q <= u0_m0_wo0_mtree_mult1_7_shift4_qint(25 downto 0);

    -- u0_m0_wo0_sym_add5(ADD,63)@10 + 1
    u0_m0_wo0_sym_add5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr5_q(15)) & u0_m0_wo0_wi0_r0_delayr5_q));
    u0_m0_wo0_sym_add5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr18_q(15)) & u0_m0_wo0_wi0_r0_delayr18_q));
    u0_m0_wo0_sym_add5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add5_a) + SIGNED(u0_m0_wo0_sym_add5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add5_q <= u0_m0_wo0_sym_add5_o(16 downto 0);

    -- u0_m0_wo0_cm5(CONSTANT,51)@0
    u0_m0_wo0_cm5_q <= "1001011101";

    -- u0_m0_wo0_mtree_mult1_6(MULT,75)@11 + 2
    u0_m0_wo0_mtree_mult1_6_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm5_q);
    u0_m0_wo0_mtree_mult1_6_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add5_q);
    u0_m0_wo0_mtree_mult1_6_reset <= areset;
    u0_m0_wo0_mtree_mult1_6_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 10,
        lpm_widthb => 17,
        lpm_widthp => 27,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_6_a0,
        datab => u0_m0_wo0_mtree_mult1_6_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_6_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_6_s1
    );
    u0_m0_wo0_mtree_mult1_6_q <= u0_m0_wo0_mtree_mult1_6_s1;

    -- u0_m0_wo0_mtree_add0_3(ADD,85)@13 + 1
    u0_m0_wo0_mtree_add0_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_mult1_6_q(26)) & u0_m0_wo0_mtree_mult1_6_q));
    u0_m0_wo0_mtree_add0_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 26 => u0_m0_wo0_mtree_mult1_7_shift4_q(25)) & u0_m0_wo0_mtree_mult1_7_shift4_q));
    u0_m0_wo0_mtree_add0_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_3_a) + SIGNED(u0_m0_wo0_mtree_add0_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_3_q <= u0_m0_wo0_mtree_add0_3_o(27 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_shift2(BITSHIFT,356)@11
    u0_m0_wo0_mtree_mult1_5_shift2_qint <= u0_m0_wo0_sym_add6_q & "00";
    u0_m0_wo0_mtree_mult1_5_shift2_q <= u0_m0_wo0_mtree_mult1_5_shift2_qint(18 downto 0);

    -- u0_m0_wo0_sym_add6(ADD,64)@10 + 1
    u0_m0_wo0_sym_add6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr6_q(15)) & u0_m0_wo0_wi0_r0_delayr6_q));
    u0_m0_wo0_sym_add6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr17_q(15)) & u0_m0_wo0_wi0_r0_delayr17_q));
    u0_m0_wo0_sym_add6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add6_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add6_a) + SIGNED(u0_m0_wo0_sym_add6_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add6_q <= u0_m0_wo0_sym_add6_o(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_sub_3(SUB,357)@11 + 1
    u0_m0_wo0_mtree_mult1_5_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 17 => u0_m0_wo0_sym_add6_q(16)) & u0_m0_wo0_sym_add6_q));
    u0_m0_wo0_mtree_mult1_5_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_5_shift2_q(18)) & u0_m0_wo0_mtree_mult1_5_shift2_q));
    u0_m0_wo0_mtree_mult1_5_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_5_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_5_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_5_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_5_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_5_sub_3_q <= u0_m0_wo0_mtree_mult1_5_sub_3_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_shift4(BITSHIFT,358)@12
    u0_m0_wo0_mtree_mult1_5_shift4_qint <= u0_m0_wo0_mtree_mult1_5_sub_3_q & "000000";
    u0_m0_wo0_mtree_mult1_5_shift4_q <= u0_m0_wo0_mtree_mult1_5_shift4_qint(25 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_shift0(BITSHIFT,354)@11
    u0_m0_wo0_mtree_mult1_5_shift0_qint <= u0_m0_wo0_sym_add6_q & "00";
    u0_m0_wo0_mtree_mult1_5_shift0_q <= u0_m0_wo0_mtree_mult1_5_shift0_qint(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_add_1(ADD,355)@11 + 1
    u0_m0_wo0_mtree_mult1_5_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 17 => u0_m0_wo0_sym_add6_q(16)) & u0_m0_wo0_sym_add6_q));
    u0_m0_wo0_mtree_mult1_5_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_5_shift0_q(18)) & u0_m0_wo0_mtree_mult1_5_shift0_q));
    u0_m0_wo0_mtree_mult1_5_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_5_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_5_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_5_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_5_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_5_add_1_q <= u0_m0_wo0_mtree_mult1_5_add_1_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_add_5(ADD,359)@12 + 1
    u0_m0_wo0_mtree_mult1_5_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 20 => u0_m0_wo0_mtree_mult1_5_add_1_q(19)) & u0_m0_wo0_mtree_mult1_5_add_1_q));
    u0_m0_wo0_mtree_mult1_5_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_mult1_5_shift4_q(25)) & u0_m0_wo0_mtree_mult1_5_shift4_q));
    u0_m0_wo0_mtree_mult1_5_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_5_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_5_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_5_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_5_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_5_add_5_q <= u0_m0_wo0_mtree_mult1_5_add_5_o(26 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_shift2(BITSHIFT,362)@11
    u0_m0_wo0_mtree_mult1_4_shift2_qint <= u0_m0_wo0_sym_add7_q & "0";
    u0_m0_wo0_mtree_mult1_4_shift2_q <= u0_m0_wo0_mtree_mult1_4_shift2_qint(17 downto 0);

    -- u0_m0_wo0_sym_add7(ADD,65)@10 + 1
    u0_m0_wo0_sym_add7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr7_q(15)) & u0_m0_wo0_wi0_r0_delayr7_q));
    u0_m0_wo0_sym_add7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr16_q(15)) & u0_m0_wo0_wi0_r0_delayr16_q));
    u0_m0_wo0_sym_add7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add7_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add7_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add7_a) + SIGNED(u0_m0_wo0_sym_add7_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add7_q <= u0_m0_wo0_sym_add7_o(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_add_3(ADD,363)@11 + 1
    u0_m0_wo0_mtree_mult1_4_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 17 => u0_m0_wo0_sym_add7_q(16)) & u0_m0_wo0_sym_add7_q));
    u0_m0_wo0_mtree_mult1_4_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_4_shift2_q(17)) & u0_m0_wo0_mtree_mult1_4_shift2_q));
    u0_m0_wo0_mtree_mult1_4_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_4_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_add_3_q <= u0_m0_wo0_mtree_mult1_4_add_3_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_shift4(BITSHIFT,364)@12
    u0_m0_wo0_mtree_mult1_4_shift4_qint <= u0_m0_wo0_mtree_mult1_4_add_3_q & "0000";
    u0_m0_wo0_mtree_mult1_4_shift4_q <= u0_m0_wo0_mtree_mult1_4_shift4_qint(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_shift0(BITSHIFT,360)@11
    u0_m0_wo0_mtree_mult1_4_shift0_qint <= u0_m0_wo0_sym_add7_q & "00";
    u0_m0_wo0_mtree_mult1_4_shift0_q <= u0_m0_wo0_mtree_mult1_4_shift0_qint(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_add_1(ADD,361)@11 + 1
    u0_m0_wo0_mtree_mult1_4_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 17 => u0_m0_wo0_sym_add7_q(16)) & u0_m0_wo0_sym_add7_q));
    u0_m0_wo0_mtree_mult1_4_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_4_shift0_q(18)) & u0_m0_wo0_mtree_mult1_4_shift0_q));
    u0_m0_wo0_mtree_mult1_4_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_4_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_add_1_q <= u0_m0_wo0_mtree_mult1_4_add_1_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_add_5(ADD,365)@12 + 1
    u0_m0_wo0_mtree_mult1_4_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 20 => u0_m0_wo0_mtree_mult1_4_add_1_q(19)) & u0_m0_wo0_mtree_mult1_4_add_1_q));
    u0_m0_wo0_mtree_mult1_4_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_mult1_4_shift4_q(22)) & u0_m0_wo0_mtree_mult1_4_shift4_q));
    u0_m0_wo0_mtree_mult1_4_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_4_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_add_5_q <= u0_m0_wo0_mtree_mult1_4_add_5_o(23 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_shift6(BITSHIFT,366)@13
    u0_m0_wo0_mtree_mult1_4_shift6_qint <= u0_m0_wo0_mtree_mult1_4_add_5_q & "0000";
    u0_m0_wo0_mtree_mult1_4_shift6_q <= u0_m0_wo0_mtree_mult1_4_shift6_qint(27 downto 0);

    -- u0_m0_wo0_mtree_add0_2(ADD,84)@13 + 1
    u0_m0_wo0_mtree_add0_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_mult1_4_shift6_q(27)) & u0_m0_wo0_mtree_mult1_4_shift6_q));
    u0_m0_wo0_mtree_add0_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 27 => u0_m0_wo0_mtree_mult1_5_add_5_q(26)) & u0_m0_wo0_mtree_mult1_5_add_5_q));
    u0_m0_wo0_mtree_add0_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_2_a) + SIGNED(u0_m0_wo0_mtree_add0_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_2_q <= u0_m0_wo0_mtree_add0_2_o(28 downto 0);

    -- u0_m0_wo0_mtree_add1_1(ADD,89)@14 + 1
    u0_m0_wo0_mtree_add1_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_add0_2_q(28)) & u0_m0_wo0_mtree_add0_2_q));
    u0_m0_wo0_mtree_add1_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 28 => u0_m0_wo0_mtree_add0_3_q(27)) & u0_m0_wo0_mtree_add0_3_q));
    u0_m0_wo0_mtree_add1_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_1_a) + SIGNED(u0_m0_wo0_mtree_add1_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_1_q <= u0_m0_wo0_mtree_add1_1_o(29 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_shift2(BITSHIFT,369)@11
    u0_m0_wo0_mtree_mult1_3_shift2_qint <= u0_m0_wo0_sym_add8_q & "00";
    u0_m0_wo0_mtree_mult1_3_shift2_q <= u0_m0_wo0_mtree_mult1_3_shift2_qint(18 downto 0);

    -- u0_m0_wo0_sym_add8(ADD,66)@10 + 1
    u0_m0_wo0_sym_add8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr8_q(15)) & u0_m0_wo0_wi0_r0_delayr8_q));
    u0_m0_wo0_sym_add8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr15_q(15)) & u0_m0_wo0_wi0_r0_delayr15_q));
    u0_m0_wo0_sym_add8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add8_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add8_a) + SIGNED(u0_m0_wo0_sym_add8_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add8_q <= u0_m0_wo0_sym_add8_o(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_sub_3(SUB,370)@11 + 1
    u0_m0_wo0_mtree_mult1_3_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 17 => u0_m0_wo0_sym_add8_q(16)) & u0_m0_wo0_sym_add8_q));
    u0_m0_wo0_mtree_mult1_3_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_3_shift2_q(18)) & u0_m0_wo0_mtree_mult1_3_shift2_q));
    u0_m0_wo0_mtree_mult1_3_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_3_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_sub_3_q <= u0_m0_wo0_mtree_mult1_3_sub_3_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_shift4(BITSHIFT,371)@12
    u0_m0_wo0_mtree_mult1_3_shift4_qint <= u0_m0_wo0_mtree_mult1_3_sub_3_q & "00000";
    u0_m0_wo0_mtree_mult1_3_shift4_q <= u0_m0_wo0_mtree_mult1_3_shift4_qint(24 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_shift0(BITSHIFT,367)@11
    u0_m0_wo0_mtree_mult1_3_shift0_qint <= u0_m0_wo0_sym_add8_q & "00";
    u0_m0_wo0_mtree_mult1_3_shift0_q <= u0_m0_wo0_mtree_mult1_3_shift0_qint(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_sub_1(SUB,368)@11 + 1
    u0_m0_wo0_mtree_mult1_3_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_3_shift0_q(18)) & u0_m0_wo0_mtree_mult1_3_shift0_q));
    u0_m0_wo0_mtree_mult1_3_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 17 => u0_m0_wo0_sym_add8_q(16)) & u0_m0_wo0_sym_add8_q));
    u0_m0_wo0_mtree_mult1_3_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_3_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_sub_1_q <= u0_m0_wo0_mtree_mult1_3_sub_1_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_add_5(ADD,372)@12 + 1
    u0_m0_wo0_mtree_mult1_3_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 20 => u0_m0_wo0_mtree_mult1_3_sub_1_q(19)) & u0_m0_wo0_mtree_mult1_3_sub_1_q));
    u0_m0_wo0_mtree_mult1_3_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_3_shift4_q(24)) & u0_m0_wo0_mtree_mult1_3_shift4_q));
    u0_m0_wo0_mtree_mult1_3_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_3_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_add_5_q <= u0_m0_wo0_mtree_mult1_3_add_5_o(25 downto 0);

    -- u0_m0_wo0_sym_add9(ADD,67)@10 + 1
    u0_m0_wo0_sym_add9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr9_q(15)) & u0_m0_wo0_wi0_r0_delayr9_q));
    u0_m0_wo0_sym_add9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr14_q(15)) & u0_m0_wo0_wi0_r0_delayr14_q));
    u0_m0_wo0_sym_add9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add9_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add9_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add9_a) + SIGNED(u0_m0_wo0_sym_add9_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add9_q <= u0_m0_wo0_sym_add9_o(16 downto 0);

    -- u0_m0_wo0_cm9(CONSTANT,55)@0
    u0_m0_wo0_cm9_q <= "100101100100";

    -- u0_m0_wo0_mtree_mult1_2(MULT,79)@11 + 2
    u0_m0_wo0_mtree_mult1_2_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm9_q);
    u0_m0_wo0_mtree_mult1_2_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add9_q);
    u0_m0_wo0_mtree_mult1_2_reset <= areset;
    u0_m0_wo0_mtree_mult1_2_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 17,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_2_a0,
        datab => u0_m0_wo0_mtree_mult1_2_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_2_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_2_s1
    );
    u0_m0_wo0_mtree_mult1_2_q <= u0_m0_wo0_mtree_mult1_2_s1;

    -- u0_m0_wo0_mtree_add0_1(ADD,83)@13 + 1
    u0_m0_wo0_mtree_add0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_mult1_2_q(28)) & u0_m0_wo0_mtree_mult1_2_q));
    u0_m0_wo0_mtree_add0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 26 => u0_m0_wo0_mtree_mult1_3_add_5_q(25)) & u0_m0_wo0_mtree_mult1_3_add_5_q));
    u0_m0_wo0_mtree_add0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_1_a) + SIGNED(u0_m0_wo0_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_1_q <= u0_m0_wo0_mtree_add0_1_o(29 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_shift0(BITSHIFT,382)@11
    u0_m0_wo0_mtree_mult1_1_shift0_qint <= u0_m0_wo0_sym_add10_q & "0000000";
    u0_m0_wo0_mtree_mult1_1_shift0_q <= u0_m0_wo0_mtree_mult1_1_shift0_qint(23 downto 0);

    -- u0_m0_wo0_sym_add10(ADD,68)@10 + 1
    u0_m0_wo0_sym_add10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr10_q(15)) & u0_m0_wo0_wi0_r0_delayr10_q));
    u0_m0_wo0_sym_add10_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr13_q(15)) & u0_m0_wo0_wi0_r0_delayr13_q));
    u0_m0_wo0_sym_add10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add10_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add10_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add10_a) + SIGNED(u0_m0_wo0_sym_add10_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add10_q <= u0_m0_wo0_sym_add10_o(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_add_1(ADD,383)@11 + 1
    u0_m0_wo0_mtree_mult1_1_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 17 => u0_m0_wo0_sym_add10_q(16)) & u0_m0_wo0_sym_add10_q));
    u0_m0_wo0_mtree_mult1_1_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_1_shift0_q(23)) & u0_m0_wo0_mtree_mult1_1_shift0_q));
    u0_m0_wo0_mtree_mult1_1_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_1_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_1_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_add_1_q <= u0_m0_wo0_mtree_mult1_1_add_1_o(24 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_shift2(BITSHIFT,384)@11
    u0_m0_wo0_mtree_mult1_1_shift2_qint <= u0_m0_wo0_sym_add10_q & "00";
    u0_m0_wo0_mtree_mult1_1_shift2_q <= u0_m0_wo0_mtree_mult1_1_shift2_qint(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_sub_3(SUB,385)@11 + 1
    u0_m0_wo0_mtree_mult1_1_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_1_shift2_q(18)) & u0_m0_wo0_mtree_mult1_1_shift2_q));
    u0_m0_wo0_mtree_mult1_1_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 17 => u0_m0_wo0_sym_add10_q(16)) & u0_m0_wo0_sym_add10_q));
    u0_m0_wo0_mtree_mult1_1_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_1_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_1_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_sub_3_q <= u0_m0_wo0_mtree_mult1_1_sub_3_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_shift4(BITSHIFT,386)@12
    u0_m0_wo0_mtree_mult1_1_shift4_qint <= u0_m0_wo0_mtree_mult1_1_sub_3_q & "000000000";
    u0_m0_wo0_mtree_mult1_1_shift4_q <= u0_m0_wo0_mtree_mult1_1_shift4_qint(28 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_sub_5(SUB,387)@12 + 1
    u0_m0_wo0_mtree_mult1_1_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_mult1_1_shift4_q(28)) & u0_m0_wo0_mtree_mult1_1_shift4_q));
    u0_m0_wo0_mtree_mult1_1_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 25 => u0_m0_wo0_mtree_mult1_1_add_1_q(24)) & u0_m0_wo0_mtree_mult1_1_add_1_q));
    u0_m0_wo0_mtree_mult1_1_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_1_sub_5_a) - SIGNED(u0_m0_wo0_mtree_mult1_1_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_sub_5_q <= u0_m0_wo0_mtree_mult1_1_sub_5_o(29 downto 0);

    -- u0_m0_wo0_sym_add11(ADD,69)@10 + 1
    u0_m0_wo0_sym_add11_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr11_q(15)) & u0_m0_wo0_wi0_r0_delayr11_q));
    u0_m0_wo0_sym_add11_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr12_q(15)) & u0_m0_wo0_wi0_r0_delayr12_q));
    u0_m0_wo0_sym_add11_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add11_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add11_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add11_a) + SIGNED(u0_m0_wo0_sym_add11_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add11_q <= u0_m0_wo0_sym_add11_o(16 downto 0);

    -- u0_m0_wo0_cm11(CONSTANT,57)@0
    u0_m0_wo0_cm11_q <= "01110001001101";

    -- u0_m0_wo0_mtree_mult1_0(MULT,81)@11 + 2
    u0_m0_wo0_mtree_mult1_0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm11_q);
    u0_m0_wo0_mtree_mult1_0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add11_q);
    u0_m0_wo0_mtree_mult1_0_reset <= areset;
    u0_m0_wo0_mtree_mult1_0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 14,
        lpm_widthb => 17,
        lpm_widthp => 31,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_0_a0,
        datab => u0_m0_wo0_mtree_mult1_0_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_0_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_0_s1
    );
    u0_m0_wo0_mtree_mult1_0_q <= u0_m0_wo0_mtree_mult1_0_s1;

    -- u0_m0_wo0_mtree_add0_0(ADD,82)@13 + 1
    u0_m0_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_mult1_0_q(30)) & u0_m0_wo0_mtree_mult1_0_q));
    u0_m0_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 30 => u0_m0_wo0_mtree_mult1_1_sub_5_q(29)) & u0_m0_wo0_mtree_mult1_1_sub_5_q));
    u0_m0_wo0_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_a) + SIGNED(u0_m0_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_q <= u0_m0_wo0_mtree_add0_0_o(31 downto 0);

    -- u0_m0_wo0_mtree_add1_0(ADD,88)@14 + 1
    u0_m0_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_add0_0_q(31)) & u0_m0_wo0_mtree_add0_0_q));
    u0_m0_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 30 => u0_m0_wo0_mtree_add0_1_q(29)) & u0_m0_wo0_mtree_add0_1_q));
    u0_m0_wo0_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_0_a) + SIGNED(u0_m0_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_q <= u0_m0_wo0_mtree_add1_0_o(32 downto 0);

    -- u0_m0_wo0_mtree_add2_0(ADD,91)@15 + 1
    u0_m0_wo0_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_add1_0_q(32)) & u0_m0_wo0_mtree_add1_0_q));
    u0_m0_wo0_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 30 => u0_m0_wo0_mtree_add1_1_q(29)) & u0_m0_wo0_mtree_add1_1_q));
    u0_m0_wo0_mtree_add2_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_0_a) + SIGNED(u0_m0_wo0_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_0_q <= u0_m0_wo0_mtree_add2_0_o(33 downto 0);

    -- u0_m0_wo0_mtree_add3_0(ADD,92)@16 + 1
    u0_m0_wo0_mtree_add3_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 34 => u0_m0_wo0_mtree_add2_0_q(33)) & u0_m0_wo0_mtree_add2_0_q));
    u0_m0_wo0_mtree_add3_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 29 => u0_m0_wo0_mtree_add1_2_q(28)) & u0_m0_wo0_mtree_add1_2_q));
    u0_m0_wo0_mtree_add3_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add3_0_a) + SIGNED(u0_m0_wo0_mtree_add3_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_0_q <= u0_m0_wo0_mtree_add3_0_o(34 downto 0);

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- d_u0_m0_wo0_compute_q_16(DELAY,1008)@11 + 5
    d_u0_m0_wo0_compute_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_11_q, xout => d_u0_m0_wo0_compute_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_oseq_gated_reg(REG,93)@16 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(d_u0_m0_wo0_compute_q_16_q);
        END IF;
    END PROCESS;

    -- xOut(PORTOUT,318)@17 + 1
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_mtree_add3_0_q;
    xOut_1 <= u0_m0_wo1_mtree_add4_0_q;
    xOut_2 <= u0_m0_wo2_mtree_add4_0_q;

END normal;
