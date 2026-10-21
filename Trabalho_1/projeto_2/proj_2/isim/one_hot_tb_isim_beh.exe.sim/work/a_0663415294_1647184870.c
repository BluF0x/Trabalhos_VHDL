/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/VHDL/Trabalho_1/projeto_2/proj_2/one_hot_og.vhd";
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);


static void work_a_0663415294_1647184870_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;

LAB0:    xsi_set_current_line(33, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t2 = t1;
    memset(t2, (unsigned char)2, 8U);
    t3 = (t0 + 2984);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 8U);
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(34, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 4656U);
    t8 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t2, t1);
    t3 = (t0 + 1608U);
    t4 = *((char **)t3);
    t3 = (t4 + 0);
    *((int *)t3) = t8;
    xsi_set_current_line(35, ng0);
    t1 = (t0 + 1608U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t9 = (t8 - 7);
    t10 = (t9 * -1);
    t11 = (1 * t10);
    t12 = (0U + t11);
    t1 = (t0 + 2984);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, t12, 1, 0LL);
    t1 = (t0 + 2904);
    *((int *)t1) = 1;

LAB1:    return;
}


extern void work_a_0663415294_1647184870_init()
{
	static char *pe[] = {(void *)work_a_0663415294_1647184870_p_0};
	xsi_register_didat("work_a_0663415294_1647184870", "isim/one_hot_tb_isim_beh.exe.sim/work/a_0663415294_1647184870.didat");
	xsi_register_executes(pe);
}
